import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:the_weather/core/error/exception.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:the_weather/core/platform/location_info.dart';
import 'package:the_weather/core/network/network_info.dart';
import 'package:the_weather/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:the_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:the_weather/features/weather/data/remote_models/weather_entity_model.dart';
import 'package:the_weather/features/weather/data/repositories/weather_repo_impl.dart';

class MockRemoteDataSource extends Mock implements WeatherRemoteDataSource {}

// class MockLocalDataSource extends Mock implements WeatherLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockLocationInfo extends Mock implements LocationInfo {}

void main() {
  WeatherRepoImpl weatherRepoImpl;
  MockRemoteDataSource mockRemoteDataSource;
  // MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;
  MockLocationInfo mockLocationInfo;

  void runTestsOnline(Function body) {
    group('Device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockLocationInfo.isServiceEnabled).thenAnswer((_) async => true);
        when(mockLocationInfo.permissionState)
            .thenAnswer((_) async => Right(LocationPermission.always));
        when(mockLocationInfo.currentPosition)
            .thenAnswer((_) async => Right(Position()));
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('Device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    // mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockLocationInfo = MockLocationInfo();

    weatherRepoImpl = WeatherRepoImpl(
      remoteDataSource: mockRemoteDataSource,
      // localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
      locationInfo: mockLocationInfo,
    );
  });

  group('getWeatherByCityName', () {
    // ignore: missing_required_param
    final weatherEntityModel = WeatherEntityModel();
    final weatherEntity = weatherEntityModel;

    runTestsOnline(() {
      test('should check if the device is online', () async {
        await weatherRepoImpl.getWeatherByCityName(cityName: null);
        verify(mockNetworkInfo.isConnected);
        expect(await mockNetworkInfo.isConnected, true);
      });

      test('should return remote data source when remote call is successful',
          () async {
        when(mockRemoteDataSource.getWeatherInfoByNaming('Baghdad'))
            .thenAnswer((_) async => weatherEntityModel);

        final result =
            await weatherRepoImpl.getWeatherByCityName(cityName: 'Baghdad');

        verify(mockRemoteDataSource.getWeatherInfoByNaming('Baghdad'));
        expect(result, Right(weatherEntity));
      });

      // test('should cache data locally when remote call is successful',
      //     () async {
      //   when(mockRemoteDataSource.getWeatherInfoByNaming('Baghdad'))
      //       .thenAnswer((_) async => weatherEntityModel);

      //   final result =
      //       await weatherRepoImpl.getWeatherByCityName(cityName: 'Baghdad');

      //   verify(mockLocalDataSource.cacheWeatherState(weatherEntityModel));
      // });

      test('should return ServerException when remote call is unsuccessful ',
          () async {
        when(mockRemoteDataSource.getWeatherInfoByNaming('Baghdad'))
            .thenThrow(ServerException());

        final result =
            await weatherRepoImpl.getWeatherByCityName(cityName: 'Baghdad');

        verify(mockRemoteDataSource.getWeatherInfoByNaming('Baghdad'));
        expect(result, Left(ServerFailure()));
      });
    }); //runTestsOnline

    // runTestsOffline(() {
    //   test('should return cached data if there is some', () async {
    //     when(mockLocalDataSource.getLastWeatherState())
    //         .thenAnswer((_) async => weatherEntityModel);

    //     final result =
    //         await weatherRepoImpl.getWeatherByCityName(cityName: 'Baghdad');

    //     verifyZeroInteractions(mockRemoteDataSource);
    //     verify(mockLocalDataSource.getLastWeatherState());
    //     expect(result, Right(weatherEntity));
    //   });

    //   test('should return CacheException if there\'s no data to show',
    //       () async {
    //     when(mockLocalDataSource.getLastWeatherState())
    //         .thenThrow(CacheException());

    //     final result =
    //         await weatherRepoImpl.getWeatherByCityName(cityName: 'Baghdad');

    //     verifyZeroInteractions(mockRemoteDataSource);
    //     verify(mockLocalDataSource.getLastWeatherState());
    //     expect(result, Left(CacheFailure()));
    //   });
    // });
  });

  group('getWeatherByCoordinates', () {
    // ignore: missing_required_param
    final weatherEntityModel = WeatherEntityModel();
    final weatherEntity = weatherEntityModel;

    runTestsOnline(() {
      test('should check if the device is online', () async {
        await weatherRepoImpl.getWeatherByCoordinates();
        verify(mockNetworkInfo.isConnected);
        expect(await mockNetworkInfo.isConnected, true);
      });
      test('should check if the location service is ON', () async {
        when(mockLocationInfo.isServiceEnabled).thenAnswer((_) async => true);

        await weatherRepoImpl.getWeatherByCoordinates();

        verify(mockLocationInfo.isServiceEnabled);
        expect(await mockLocationInfo.isServiceEnabled, true);
      });

      test('should check if we are checking the requesting permission state',
          () async {
        await weatherRepoImpl.getWeatherByCoordinates();

        verify(mockLocationInfo.permissionState);
      });

      test('should get data if the loc permission was accepted', () async {
        when(mockLocationInfo.permissionState).thenAnswer((_) async =>
            Right(LocationPermission.always)); //Also for whileInUSe

        await weatherRepoImpl.getWeatherByCoordinates();

        verify(mockLocationInfo.permissionState);
        verify(mockRemoteDataSource.getWeatherInfoByCoordinates(any, any));
      });

      test(
          'should return [PermissionDeniedFailure] if the loc permission wasn\'t accepted',
          () async {
        when(mockLocationInfo.permissionState).thenAnswer((_) async =>
            Right(LocationPermission.denied)); //Also for whileInUSe

        final result = await weatherRepoImpl.getWeatherByCoordinates();

        verify(mockLocationInfo.permissionState);
        expect(result, Left(PermissionDeniedFailure()));
      });

      test('should get location of the user when permission allowed', () async {
        when(mockLocationInfo.currentPosition)
            .thenAnswer((_) async => Right(Position()));

        await weatherRepoImpl.getWeatherByCoordinates();

        verify(mockLocationInfo.currentPosition);
        expect(await mockLocationInfo.currentPosition, Right(Position()));
      });

      test(
          'should return [PermissionDeniedFailure] when getting location miss the permission',
          () async {
        when(mockLocationInfo.currentPosition)
            .thenAnswer((_) async => Left(PermissionDeniedFailure()));

        await weatherRepoImpl.getWeatherByCoordinates();

        verify(mockLocationInfo.currentPosition);
        expect(await mockLocationInfo.currentPosition,
            Left(PermissionDeniedFailure()));
      });

      test('should return Remote data source when remote call is successful',
          () async {
        when(mockRemoteDataSource.getWeatherInfoByCoordinates(any, any))
            .thenAnswer((_) async => weatherEntityModel);

        final result = await weatherRepoImpl.getWeatherByCoordinates();

        verify(mockRemoteDataSource.getWeatherInfoByCoordinates(any, any));
        expect(result, Right(weatherEntity));
      });

      // test('should cache data locally when remote call is successful',
      //     () async {
      //   when(mockRemoteDataSource.getWeatherInfoByCoordinates(44.0, 33.0))
      //       .thenAnswer((_) async => weatherEntityModel);

      //   final result =
      //       await weatherRepoImpl.getWeatherByCoordinates(lat: 44.0, lon: 33.0);

      //   verify(mockLocalDataSource.cacheWeatherState(weatherEntityModel));
      // });

      test('should return ServerException when remote call is unsuccessful ',
          () async {
        when(mockRemoteDataSource.getWeatherInfoByCoordinates(any, any))
            .thenThrow(ServerException());

        final result = await weatherRepoImpl.getWeatherByCoordinates();

        verify(mockRemoteDataSource.getWeatherInfoByCoordinates(any, any));
        expect(result, Left(ServerFailure()));
      });
    });

    // runTestsOffline(() {
    //   test('should return cached data if there is some', () async {
    //     when(mockLocalDataSource.getLastWeatherState())
    //         .thenAnswer((_) async => weatherEntityModel);

    //     final result =
    //         await weatherRepoImpl.getWeatherByCoordinates(lat: 44.0, lon: 33.0);

    //     verifyZeroInteractions(mockRemoteDataSource);
    //     verify(mockLocalDataSource.getLastWeatherState());
    //     expect(result, Right(weatherEntity));
    //   });

    //   test('should return CacheException if there\'s no data to show',
    //       () async {
    //     when(mockLocalDataSource.getLastWeatherState())
    //         .thenThrow(CacheException());

    //     final result =
    //         await weatherRepoImpl.getWeatherByCoordinates(lat: 44.0, lon: 33.0);

    //     verifyZeroInteractions(mockRemoteDataSource);
    //     verify(mockLocalDataSource.getLastWeatherState());
    //     expect(result, Left(CacheFailure()));
    //   });
    // });
  });
}
