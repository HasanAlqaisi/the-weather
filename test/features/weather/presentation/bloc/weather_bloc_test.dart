import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:the_weather/core/error/exception.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:the_weather/core/platform/location_info.dart';
import 'package:the_weather/features/weather/data/models/weather_entity_model.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather/features/weather/domain/usecases/get_weather_city.dart';
import 'package:the_weather/features/weather/domain/usecases/get_weather_coordinates.dart';
import 'package:the_weather/features/weather/presentation/bloc/weather_bloc.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../data/repositories/weather_repo_impl_test.dart';

class MockGetWeatherByCityName extends Mock implements GetWeatherByCityName {}

class MockGetWeatherByCoordinates extends Mock
    implements GetWeatherByCoordinates {}

class MockLocationInfo extends Mock implements LocationInfo {}

void main() {
  MockGetWeatherByCityName mockGetWeatherByCityName;
  MockGetWeatherByCoordinates mockGetWeatherByCoordinates;
  WeatherBloc weatherBloc;
  MockLocationInfo mockLocationInfo;

  setUp(() {
    mockGetWeatherByCityName = MockGetWeatherByCityName();
    mockGetWeatherByCoordinates = MockGetWeatherByCoordinates();
    mockLocationInfo = MockLocationInfo();
    weatherBloc = WeatherBloc(
      getWeatherByCityName: mockGetWeatherByCityName,
      getWeatherByCoordinates: mockGetWeatherByCoordinates,
      locationInfo: mockLocationInfo,
    );
  });

  group('GetWeatherByCoordinatesEvent', () {
    const lat = 44.0;
    const lon = 33.0;
    Params params = Params(lat: lat, lon: lon);

    final WeatherEntity weatherEntity = WeatherEntityModel.fromJson(
        json.decode(fixture('weather_response.json')));
    test('should get data from use case', () async {
      when(mockGetWeatherByCoordinates())
          .thenAnswer((_) async => Right(weatherEntity));

      weatherBloc.add(GetWeatherByCoordinatesEvent());
      await untilCalled(mockGetWeatherByCoordinates());

      verify(mockGetWeatherByCoordinates());
    });

    test('should emit [Loading, Loaded] when data gotten successfuly', () {
      when(mockGetWeatherByCoordinates())
          .thenAnswer((_) async => Right(weatherEntity));

      final expectedStates = [Loading(), Loaded(weatherEntity)];
      expectLater(
          weatherBloc.asBroadcastStream(), emitsInOrder(expectedStates));
      weatherBloc.asBroadcastStream().forEach((element) {
        print(element);
      });
      weatherBloc.add(GetWeatherByCoordinatesEvent());
    });

    test('should emit [Loading, Error] when ServerException happens', () {
      when(mockGetWeatherByCoordinates())
          .thenAnswer((_) async => Left(ServerFailure()));

      final expectedStates = [Loading(), Error(ServerFailure())];
      expectLater(
          weatherBloc.asBroadcastStream(), emitsInOrder(expectedStates));
      weatherBloc.asBroadcastStream().forEach((element) {
        print(element);
      });
      weatherBloc.add(GetWeatherByCoordinatesEvent());
    });

    test('should emit [Loading, Error] when CacheException happenes', () {
      when(mockGetWeatherByCoordinates())
          .thenAnswer((_) async => Left(CacheFailure()));

      final expectedStates = [Loading(), Error(CacheFailure())];
      expectLater(
          weatherBloc.asBroadcastStream(), emitsInOrder(expectedStates));
      weatherBloc.asBroadcastStream().forEach((element) {
        print(element);
      });
      weatherBloc.add(GetWeatherByCoordinatesEvent());
    });
  });

  group('GetWeatherByNamingEvent', () {
    const cityName = 'Baghdad';

    final WeatherEntity weatherEntity = WeatherEntityModel.fromJson(
        json.decode(fixture('weather_response.json')));
    test('should get data from use case', () async {
      when(mockGetWeatherByCityName(cityName))
          .thenAnswer((_) async => Right(weatherEntity));

      weatherBloc.add(GetWeatherByNamingEvent(cityName));
      await untilCalled(mockGetWeatherByCityName(any));

      verify(mockGetWeatherByCityName(cityName));
    });

    test('should emit [Loading, Loaded] when data gotten successfuly', () {
      when(mockGetWeatherByCityName(cityName))
          .thenAnswer((_) async => Right(weatherEntity));

      final expectedStates = [Loading(), Loaded(weatherEntity)];
      expectLater(
          weatherBloc.asBroadcastStream(), emitsInOrder(expectedStates));
      weatherBloc.asBroadcastStream().forEach((element) {
        print(element);
      });
      weatherBloc.add(GetWeatherByNamingEvent(cityName));
    });

    test('should emit [Loading, Error] when ServerException happens', () {
      when(mockGetWeatherByCityName(cityName))
          .thenAnswer((_) async => Left(ServerFailure()));

      final expectedStates = [Loading(), Error(ServerFailure())];
      expectLater(
          weatherBloc.asBroadcastStream(), emitsInOrder(expectedStates));
      weatherBloc.asBroadcastStream().forEach((element) {
        print(element);
      });
      weatherBloc.add(GetWeatherByNamingEvent(cityName));
    });

    test('should emit [Loading, Error] when CacheException happenes', () {
      when(mockGetWeatherByCityName(cityName))
          .thenAnswer((_) async => Left(CacheFailure()));

      final expectedStates = [Loading(), Error(CacheFailure())];
      expectLater(
          weatherBloc.asBroadcastStream(), emitsInOrder(expectedStates));
      weatherBloc.asBroadcastStream().forEach((element) {
        print(element);
      });
      weatherBloc.add(GetWeatherByNamingEvent(cityName));
    });
  });
}
