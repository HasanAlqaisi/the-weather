import 'package:flutter/foundation.dart';
import 'package:the_weather/features/weather/domain/entities/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherModel({
    @required this.id,
    @required this.main,
    @required this.description,
    @required this.icon,
  }) : super(id: id, main: main, description: description, icon: icon);

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
