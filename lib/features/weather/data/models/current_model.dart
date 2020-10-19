import 'package:flutter/foundation.dart';
import 'package:the_weather/features/weather/domain/entities/current.dart';
import 'package:json_annotation/json_annotation.dart';
import 'weather_model.dart';

part 'current_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentModel extends Current {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'dew_point')
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_deg')
  final int windDeg;
  @JsonKey(name: 'weather')
  final List<WeatherModel> weatherModel;

  CurrentModel({
    @required this.dt,
    @required this.sunrise,
    @required this.sunset,
    @required this.temp,
    @required this.feelsLike,
    @required this.pressure,
    @required this.humidity,
    @required this.dewPoint,
    @required this.uvi,
    @required this.clouds,
    @required this.visibility,
    @required this.windSpeed,
    @required this.windDeg,
    @required this.weatherModel,
  }) : super(
          dt: dt,
          sunrise: sunrise,
          sunset: sunset,
          temp: temp,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          dewPoint: dewPoint,
          uvi: uvi,
          clouds: clouds,
          visibility: visibility,
          windSpeed: windSpeed,
          windDeg: windDeg,
          weather: weatherModel,
        );

  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentModelToJson(this);
}
