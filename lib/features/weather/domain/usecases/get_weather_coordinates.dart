import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:the_weather/core/usecases/usecase.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather/features/weather/domain/repositories/weather_repo.dart';

class GetWeatherByCoordinates extends UseCase<WeatherEntity> {
  final WeatherRepo weatherRepo;

  GetWeatherByCoordinates(this.weatherRepo);

  @override
  Future<Either<Failure, WeatherEntity>> call() async {
    return await weatherRepo.getWeatherByCoordinates();
  }
}

class Params extends Equatable {
  final double lat;
  final double lon;

  Params({@required this.lat, @required this.lon});

  @override
  List<Object> get props => [lat, lon];
}
