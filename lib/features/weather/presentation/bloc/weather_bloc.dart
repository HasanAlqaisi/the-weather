import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_weather/core/error/exception.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:the_weather/core/platform/location_info.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather/features/weather/domain/usecases/get_weather_city.dart';
import 'package:the_weather/features/weather/domain/usecases/get_weather_coordinates.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  GetWeatherByCityName getWeatherByCityName;
  GetWeatherByCoordinates getWeatherByCoordinates;
  LocationInfo locationInfo;

  WeatherBloc({
    @required this.getWeatherByCityName,
    @required this.getWeatherByCoordinates,
    @required this.locationInfo,
  }) : super(Initial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeatherByCoordinatesEvent) {
      yield Loading();
      final weatherEntityOrFailure = await getWeatherByCoordinates();
      yield weatherEntityOrFailure.fold(
          (failure) => Error(failure), (data) => Loaded(data));
    } else if (event is GetWeatherByNamingEvent) {
      yield Loading();
      final weatherEntityOrFailure = await getWeatherByCityName(event.cityName);
      yield weatherEntityOrFailure.fold(
          (failure) => Error(failure), (data) => Loaded(data));
    }
  }
}
