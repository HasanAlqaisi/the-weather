import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';

// part 'feels_like.g.dart';

// @JsonSerializable(explicitToJson: true, nullable: false)
class FeelsLike extends Equatable {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  @override
  List<Object> get props => [day, night, eve, morn];

  // factory FeelsLike.fromJson(Map<String, dynamic> json) =>
  //     _$FeelsLikeFromJson(json);

  // Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}

// class FeelsLikeConverter extends TypeConverter<FeelsLike, String> {
//   @override
//   FeelsLike mapToDart(String fromDb) {
//     if (fromDb == null) {
//       return null;
//     }
//     return FeelsLike.fromJson(json.decode(fromDb) as Map<String, dynamic>);
//   }

//   @override
//   String mapToSql(FeelsLike value) {
//     if (value == null) {
//       return null;
//     }
//     return json.encode(value.toJson());
//   }
// }
