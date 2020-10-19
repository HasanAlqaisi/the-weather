part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeatherByNamingEvent extends WeatherEvent {
  final String cityName;

  GetWeatherByNamingEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class GetWeatherByCoordinatesEvent extends WeatherEvent {
  GetWeatherByCoordinatesEvent();

  @override
  List<Object> get props => [];
}