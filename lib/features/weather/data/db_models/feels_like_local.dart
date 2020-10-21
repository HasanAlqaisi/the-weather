import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/data/remote_models/feels_like_model.dart';

part 'feels_like_local.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class FeelsLikeLocal extends Equatable {
  final double day;
  final double night;

  FeelsLikeLocal({this.day, this.night});

  @override
  List<Object> get props => [day, night];

  factory FeelsLikeLocal.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeLocalFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeLocalToJson(this);

  factory FeelsLikeLocal.fromFeelsLikeModel(FeelsLikeModel feelsLikeModel) {
    return FeelsLikeLocal(
      day: feelsLikeModel.day,
      night: feelsLikeModel.night,
    );
  }
}

class FeelsLikeConverter extends TypeConverter<FeelsLikeLocal, String> {
  @override
  FeelsLikeLocal mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return FeelsLikeLocal.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(FeelsLikeLocal value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}
