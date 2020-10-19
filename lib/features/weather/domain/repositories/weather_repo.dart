import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherEntity>> getWeatherByCoordinates();

  Future<Either<Failure, WeatherEntity>> getWeatherByCityName({
    @required String cityName,
  });
}