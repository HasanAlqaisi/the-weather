import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:the_weather/core/network/network_info.dart';
import 'package:the_weather/core/platform/location_info.dart';
import 'package:the_weather/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:the_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:the_weather/features/weather/data/repositories/weather_repo_impl.dart';
import 'package:the_weather/features/weather/domain/entities/db/weather_entity_table.dart';
import 'package:the_weather/features/weather/domain/repositories/weather_repo.dart';
import 'package:the_weather/features/weather/domain/usecases/get_weather_city.dart';
import 'package:http/http.dart' as http;
import 'features/weather/domain/usecases/get_weather_coordinates.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';

final sl = GetIt.asNewInstance();

void init() {
  //! Features - weather

  // bloc
  sl.registerFactory(() => WeatherBloc(
      getWeatherByCityName: sl(),
      getWeatherByCoordinates: sl(),
      locationInfo: sl()));

  // use cases
  sl.registerLazySingleton(() => GetWeatherByCityName(sl()));
  sl.registerLazySingleton(() => GetWeatherByCoordinates(sl()));

// Weather Repo
  sl.registerLazySingleton<WeatherRepo>(() => WeatherRepoImpl(
        // localDataSource: sl(),
        remoteDataSource: sl(),
        networkInfo: sl(),
        locationInfo: sl(),
      ));

  // local data
  sl.registerLazySingleton<AppDataBase>(() => AppDataBase());
  sl.registerLazySingleton<WeatherDao>(() => WeatherDao(sl()));
  sl.registerLazySingleton<WeatherLocalDataSource>(
      () => WeatherLocalDataSourceImpl(dao: sl()));

  // remote data
  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: sl()));

  //! core

  // network info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // location info
  sl.registerLazySingleton<LocationInfo>(() => LocationInfoImpl(sl()));

  //! 3rd libraries

  // Data connection checker
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => GeolocatorPlatform.instance);
}
