import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/data/remote_models/weather_model.dart';

part 'weather_local.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class WeatherLocal extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherLocal({this.id, this.main, this.description, this.icon});

  @override
  List<Object> get props => [id, main, description, icon];

  factory WeatherLocal.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocalFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLocalToJson(this);

  factory WeatherLocal.fromWeatherModel(WeatherModel weatherModel) {
    return WeatherLocal(
        id: weatherModel.id,
        main: weatherModel.main,
        description: weatherModel.description,
        icon: weatherModel.icon);
  }
}

class WeatherConverter extends TypeConverter<WeatherLocal, String> {
  @override
  WeatherLocal mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return WeatherLocal.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(WeatherLocal value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}
