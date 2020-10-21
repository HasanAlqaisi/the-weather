import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';

// part 'temp.g.dart';

// @JsonSerializable(explicitToJson: true, nullable: false)
class Temp extends Equatable {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  @override
  List<Object> get props => [day, min, max, night, eve, morn];

  // factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  // Map<String, dynamic> toJson() => _$TempToJson(this);
}

// class TempConverter extends TypeConverter<Temp, String> {
//   @override
//   Temp mapToDart(String fromDb) {
//     if (fromDb == null) {
//       return null;
//     }
//     return Temp.fromJson(json.decode(fromDb) as Map<String, dynamic>);
//   }

//   @override
//   String mapToSql(Temp value) {
//     if (value == null) {
//       return null;
//     }
//     return json.encode(value.toJson());
//   }
// }
