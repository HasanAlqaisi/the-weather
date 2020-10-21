import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/data/db_models/weather_entity_local.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherEntityData> getLastWeatherState();

  Future<int> cacheWeatherState(WeatherEntityLocalCompanion weatherEntityModel);
}

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  final WeatherDao dao;

  WeatherLocalDataSourceImpl({@required this.dao});

  @override
  Future<int> cacheWeatherState(
      WeatherEntityLocalCompanion weatherEntityModel) async {
    try {
      return await dao.insertWeather(weatherEntityModel);
    } on InvalidDataException {
      throw InvalidDataException;
    }
  }

  @override
  Future<WeatherEntityData> getLastWeatherState() {
    return dao.getWeather();
  }
}
