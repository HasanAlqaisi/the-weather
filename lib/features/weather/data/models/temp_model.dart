import 'package:flutter/foundation.dart';
import 'package:the_weather/features/weather/domain/entities/temp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temp_model.g.dart';

@JsonSerializable()
class TempModel extends Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  TempModel({
    @required this.day,
    @required this.min,
    @required this.max,
    @required this.night,
    @required this.eve,
    @required this.morn,
  }) : super(
          day: day,
          min: min,
          max: max,
          night: night,
          eve: eve,
          morn: morn,
        );

  factory TempModel.fromJson(Map<String, dynamic> json) =>
      _$TempModelFromJson(json);

  Map<String, dynamic> toJson() => _$TempModelToJson(this);
}
