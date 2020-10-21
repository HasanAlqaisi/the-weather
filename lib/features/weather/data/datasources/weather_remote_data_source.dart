import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:the_weather/core/error/exception.dart';
import 'package:the_weather/core/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:the_weather/features/weather/data/remote_models/weather_entity_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherEntityModel> getWeatherInfoByNaming(String cityName);
  Future<WeatherEntityModel> getWeatherInfoByCoordinates(
      double lat, double lon);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({@required this.client});

  @override
  Future<WeatherEntityModel> getWeatherInfoByCoordinates(
      double lat, double lon) async {
    final response = await client.get(
      '$url/onecall?appid=$apiKey&exclude=$unwantedParams&lat=$lat&lon=$lon&units=metric',
    );

    if (response.statusCode == 200) {
      return WeatherEntityModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  /// I found that the API doesn't provide me with a way
  /// to get the weather info by given city name
  /// I could use a specific API to give the city and get the 
  /// coordinates but that will be waste of time for now
  /// So, that's all...
  @override
  Future<WeatherEntityModel> getWeatherInfoByNaming(String cityName) {
    throw UnimplementedError();
  }
}
