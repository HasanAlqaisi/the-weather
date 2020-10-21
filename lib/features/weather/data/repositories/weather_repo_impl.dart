import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_weather/core/error/exception.dart';
import 'package:the_weather/core/platform/location_info.dart';
import 'package:the_weather/core/network/network_info.dart';
import 'package:the_weather/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:the_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:the_weather/features/weather/data/db_models/weather_entity_local.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:the_weather/features/weather/domain/repositories/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final LocationInfo locationInfo;

  WeatherRepoImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
    @required this.locationInfo,
  });

  @override
  Future<Either<Failure, WeatherEntityData>> getWeatherByCityName(
      {String cityName}) async {
    if (await networkInfo.isConnected) {
      try {
        final weatherRemote =
            await remoteDataSource.getWeatherInfoByNaming(cityName);

        localDataSource.cacheWeatherState(
            WeatherEntityLocal.fromWeatherEntityModel(weatherRemote));

        final weatherLocal = await localDataSource.getLastWeatherState();

        return Right(weatherLocal);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    } else {
      try {
        final result = await localDataSource.getLastWeatherState();
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, WeatherEntityData>> getWeatherByCoordinates() async {
    if (await networkInfo.isConnected) {
      if (await locationInfo.isServiceEnabled) {
        final permissionState = await locationInfo.permissionState;
        return permissionState.fold((failure) {
          return Left(failure);
        }, (locPermission) async {
          switch (locPermission) {
            case LocationPermission.always:
            case LocationPermission.whileInUse:
              final positionOrFailure = await locationInfo.currentPosition;
              return positionOrFailure.fold((failure) {
                return Left(failure);
              }, (position) async {
                try {
                  final weatherRemote =
                      await remoteDataSource.getWeatherInfoByCoordinates(
                          position.latitude, position.longitude);

                  await localDataSource.cacheWeatherState(
                      WeatherEntityLocal.fromWeatherEntityModel(weatherRemote));

                  final weatherLocal =
                      await localDataSource.getLastWeatherState();

                  return Right(weatherLocal);
                } on ServerException {
                  return Left(ServerFailure());
                }
              });
              break;
            case LocationPermission.denied:
            case LocationPermission.deniedForever:
              return Left(PermissionDeniedFailure());
            default:
              return Left(NoInternetFailure());
          }
        });
      } else {
        return Left(LocationServiceOffFailure());
      }
    } else {
      try {
        final result =
            await localDataSource.getLastWeatherState() ?? CacheException();
        if (result is CacheException) throw CacheException();

        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
