import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/data/remote_models/temp_model.dart';

part 'temp_local.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class TempLocal extends Equatable {
  final double day;
  final double min;
  final double max;
  final double night;

  TempLocal({this.day, this.min, this.max, this.night});

  @override
  List<Object> get props => [day, min, max, night];

  factory TempLocal.fromJson(Map<String, dynamic> json) =>
      _$TempLocalFromJson(json);

  Map<String, dynamic> toJson() => _$TempLocalToJson(this);

  factory TempLocal.fromTempModel(TempModel temp) {
    return TempLocal(
      day: temp.day,
      min: temp.min,
      max: temp.max,
      night: temp.night,
    );
  }
}

class TempConverter extends TypeConverter<TempLocal, String> {
  @override
  TempLocal mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return TempLocal.fromJson(json.decode(fromDb));
  }

  @override
  String mapToSql(TempLocal value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}
