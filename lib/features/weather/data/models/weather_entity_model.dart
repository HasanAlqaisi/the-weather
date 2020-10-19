import 'package:flutter/foundation.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'current_model.dart';
import 'daily_model.dart';
import 'hourly_model.dart';

part 'weather_entity_model.g.dart';

@JsonSerializable(nullable: false, explicitToJson: true)
class WeatherEntityModel extends WeatherEntity {
  final double lat;
  final double lon;
  final String timezone;
  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;
  @JsonKey(name: 'current')
  final CurrentModel currentModel;
  @JsonKey(name: 'hourly')
  final List<HourlyModel> hourlyModel;
  @JsonKey(name: 'daily')
  final List<DailyModel> dailyModel;

  WeatherEntityModel({
    @required this.lat,
    @required this.lon,
    @required this.timezone,
    @required this.timezoneOffset,
    @required this.currentModel,
    @required this.hourlyModel,
    @required this.dailyModel,
  }) : super(
          lat: lat,
          lon: lon,
          timezone: timezone,
          timezoneOffset: timezoneOffset,
          current: currentModel,
          hourly: hourlyModel,
          daily: dailyModel,
        );

  factory WeatherEntityModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityModelToJson(this);
}
