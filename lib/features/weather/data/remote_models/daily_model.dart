import 'package:flutter/foundation.dart';
import 'package:the_weather/features/weather/domain/entities/daily.dart';
import 'package:json_annotation/json_annotation.dart';
import 'feels_like_model.dart';
import 'temp_model.dart';
import 'weather_model.dart';

part 'daily_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyModel extends Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  @JsonKey(name: 'temp')
  final TempModel tempModel;
  @JsonKey(name: 'feels_like')
  final FeelsLikeModel feelsLikeModel;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'dew_point')
  final double dewPoint;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_deg')
  final int windDeg;
  @JsonKey(name: 'weather')
  final List<WeatherModel> weatherModel;
  final int clouds;
  final double pop;
  final double uvi;
  final double rain;

  DailyModel({
    @required this.dt,
    @required this.sunrise,
    @required this.sunset,
    @required this.tempModel,
    @required this.feelsLikeModel,
    @required this.pressure,
    @required this.humidity,
    @required this.dewPoint,
    @required this.windSpeed,
    @required this.windDeg,
    @required this.weatherModel,
    @required this.clouds,
    @required this.pop,
    @required this.uvi,
    @required this.rain,
  }) : super(
          dt: dt,
          sunrise: sunrise,
          sunset: sunset,
          temp: tempModel,
          feelsLike: feelsLikeModel,
          pressure: pressure,
          humidity: humidity,
          dewPoint: dewPoint,
          windSpeed: windSpeed,
          windDeg: windDeg,
          weather: weatherModel,
          clouds: clouds,
          pop: pop,
          uvi: uvi,
          rain: rain,
        );

  factory DailyModel.fromJson(Map<String, dynamic> json) =>
      _$DailyModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyModelToJson(this);
}
