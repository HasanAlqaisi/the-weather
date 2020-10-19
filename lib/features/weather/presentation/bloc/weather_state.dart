part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class Initial extends WeatherState {
  @override
  List<Object> get props => [];
}

class Loading extends WeatherState {
  @override
  List<Object> get props => [];
}

class Error extends WeatherState {
  final Failure failure;

  Error(this.failure);

  @override
  List<Object> get props => [failure];
}

class Loaded extends WeatherState {
  final WeatherEntity weatherEntity;

  Loaded(this.weatherEntity);

  @override
  List<Object> get props => [weatherEntity];
}
