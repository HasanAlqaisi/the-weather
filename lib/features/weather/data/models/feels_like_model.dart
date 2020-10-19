import 'package:flutter/foundation.dart';
import 'package:the_weather/features/weather/domain/entities/feels_like.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feels_like_model.g.dart';

@JsonSerializable()
class FeelsLikeModel extends FeelsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLikeModel({
    @required this.day,
    @required this.night,
    @required this.eve,
    @required this.morn,
  }) : super(day: day, night: night, eve: eve, morn: morn);

  factory FeelsLikeModel.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeModelToJson(this);
}
