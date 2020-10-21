import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/data/remote_models/current_model.dart';

import 'weather_local.dart';

part 'current_local.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class CurrentLocal extends Equatable {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final List<WeatherLocal> weather;

  CurrentLocal(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.weather});

  @override
  List<Object> get props => [dt, temp, feelsLike, pressure, humidity, weather];

  factory CurrentLocal.fromJson(Map<String, dynamic> json) =>
      _$CurrentLocalFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentLocalToJson(this);

  factory CurrentLocal.fromCurrentModel(CurrentModel currentModel) {
    return CurrentLocal(
      dt: currentModel.dt,
      temp: currentModel.temp,
      feelsLike: currentModel.feelsLike,
      pressure: currentModel.pressure,
      humidity: currentModel.humidity,
      weather: currentModel.weatherModel
          .map((e) => WeatherLocal.fromWeatherModel(e)).toList(),
    );
  }
}

class CurrentConverter extends TypeConverter<CurrentLocal, String> {
  @override
  CurrentLocal mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return CurrentLocal.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(CurrentLocal value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}
