import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:the_weather/features/weather/data/db_models/weather_entity_local.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  AppDataBase mockDatabase;
  WeatherDao mockWeatherDao;
  WeatherLocalDataSource weatherLocalDataSource;

  setUp(() {
    // mockDatabase = AppDataBase(VmDatabase.memory());
    mockWeatherDao = WeatherDao(mockDatabase);
    weatherLocalDataSource = WeatherLocalDataSourceImpl(dao: mockWeatherDao);
  });

  tearDown(() {
    mockDatabase.close();
  });

  group('cacheWeatherState', () {
    // final weatherEntity = WeatherEntityModel.fromJson(
    //     json.decode(fixture('weather_response.json')));

    test('insert weatherEntity to database', () async {
      when(mockWeatherDao.insertWeather(any))
          .thenAnswer((_) async => 1); // assemption that 1 is the row id
      // final weatherCompanion = WeatherEntityTableCompanion(
      //   lat: Value(weatherEntity.lat),
      //   lon: Value(weatherEntity.lon),
      //   timezone: Value(weatherEntity.timezone),
      //   timezoneOffset: Value(weatherEntity.timezoneOffset),
      //   current: Value(weatherEntity.current),
      //   daily: Value(weatherEntity.daily),
      //   hourly: Value(weatherEntity.hourly),
      // );
      final result = await weatherLocalDataSource.cacheWeatherState(any);

      verify(mockWeatherDao.insertWeather(any));
      expect(result, 1);
    });
  });
}
