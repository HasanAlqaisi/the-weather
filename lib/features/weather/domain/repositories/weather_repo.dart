import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:the_weather/features/weather/data/db_models/weather_entity_local.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherEntityData>> getWeatherByCoordinates();

  Future<Either<Failure, WeatherEntityData>> getWeatherByCityName({
    @required String cityName,
  });
}