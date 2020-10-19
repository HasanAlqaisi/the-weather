import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/data/models/weather_entity_model.dart';
import 'package:the_weather/features/weather/domain/entities/db/weather_entity_table.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherDataEntity> getLastWeatherState();

  Future<int> cacheWeatherState(WeatherEntityTableCompanion weatherEntityModel);
}

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  final WeatherDao dao;

  WeatherLocalDataSourceImpl({@required this.dao});

  @override
  Future<int> cacheWeatherState(
      WeatherEntityTableCompanion weatherEntityModel) async {
    try {
      return await dao.insertWeather(weatherEntityModel);
    } on InvalidDataException {
      throw InvalidDataException;
    }
  }

  @override
  Future<WeatherDataEntity> getLastWeatherState() {
    return dao.getWeather();
  }
}
