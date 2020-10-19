import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_weather/core/error/exception.dart';
import 'package:the_weather/core/utils/constants.dart';
import 'package:the_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:the_weather/features/weather/data/models/weather_entity_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getWeatherInfoByCoordinates', () {
    double lat = 44.0, lon = 33.0;
    final weatherEntityModel = WeatherEntityModel.fromJson(
        json.decode(fixture('weather_response.json')));
    test('should return WeatherEntityModel when response code 200 (success)',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('weather_response.json'), 200),
      );

      final result = await weatherRemoteDataSourceImpl
          .getWeatherInfoByCoordinates(lat, lon);

      expect(result, weatherEntityModel);
    });

    test('should throw ServerException when response is (unsuccess)', () async {
      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => http.Response('Don\'t look at me idiot!', 404));

      final call = weatherRemoteDataSourceImpl.getWeatherInfoByCoordinates;

      expect(() => call(lat, lon), throwsA(isA<ServerException>()));
    });
  });

  // group('getWeatherInfoByNaming', () {
  //   String cityName = 'Baghdad';
  //   final weatherEntityModel = WeatherEntityModel.fromJson(
  //       json.decode(fixture('weather_response.json')));

  //   test('shoud make GET Request for weather', () async{
  //     when(mockHttpClient.get(any)).thenAnswer(
  //         (_) async => http.Response(fixture('weather_response.json'), 200));

  //         await weatherRemoteDataSourceImpl.getWeatherInfoByNaming(cityName);

  //         verify(mockHttpClient.get(any));
  //   });
  // });
}
