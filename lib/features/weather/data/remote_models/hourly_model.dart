import 'package:flutter/foundation.dart';
import 'package:the_weather/features/weather/data/remote_models/weather_model.dart';
import 'package:the_weather/features/weather/domain/entities/hourly.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hourly_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HourlyModel extends Hourly {
  final int dt;
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'dew_point')
  final double dewPoint;
  final int clouds;
  final int visibility;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_deg')
  final int windDeg;
  @JsonKey(name: 'weather')
  final List<WeatherModel> weatherModel;
  final double pop;

  HourlyModel({
    @required this.dt,
    @required this.temp,
    @required this.feelsLike,
    @required this.pressure,
    @required this.humidity,
    @required this.dewPoint,
    @required this.clouds,
    @required this.visibility,
    @required this.windSpeed,
    @required this.windDeg,
    @required this.weatherModel,
    @required this.pop,
  }) : super(
          dt: dt,
          temp: temp,
          feelsLike: feelsLike,
          pressure: pressure,
          humidity: humidity,
          dewPoint: dewPoint,
          clouds: clouds,
          visibility: visibility,
          windSpeed: windSpeed,
          windDeg: windDeg,
          weather: weatherModel,
          pop: pop,
        );

  factory HourlyModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyModelToJson(this);
}
