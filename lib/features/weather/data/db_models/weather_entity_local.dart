import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:the_weather/features/weather/data/db_models/daily_local.dart';
import 'package:the_weather/features/weather/data/db_models/hourly_local.dart';
import 'package:the_weather/features/weather/data/remote_models/weather_entity_model.dart';

import 'current_local.dart';

part 'weather_entity_local.g.dart';

@DataClassName('WeatherEntityData')
class WeatherEntityLocal extends Table {
  IntColumn get lat => integer()();
  IntColumn get lon => integer()();
  TextColumn get timezone => text()();
  IntColumn get timezoneOffset => integer()();
  TextColumn get current => text().map(CurrentConverter())();
  TextColumn get hourly => text().map(HourlyConverter())();
  TextColumn get daily => text().map(DailyConverter())();

  @override
  Set<Column> get primaryKey => {lat, lon};

  static WeatherEntityLocalCompanion fromWeatherEntityModel(
      WeatherEntityModel data) {
    return WeatherEntityLocalCompanion(
      lat: Value(data.lat.toInt()),
      lon: Value(data.lon.toInt()),
      timezone: Value(data.timezone),
      timezoneOffset: Value(data.timezoneOffset),
      current: Value(CurrentLocal.fromCurrentModel(data.currentModel)),
      hourly: Value(
          data.hourlyModel.map((e) => HourlyLocal.fromHourlyModel(e)).toList()),
      daily: Value(
          data.dailyModel.map((e) => DailyLocal.fromDailyModel(e)).toList()),
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [WeatherEntityLocal], daos: [WeatherDao])
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [WeatherEntityLocal])
class WeatherDao extends DatabaseAccessor<AppDataBase> with _$WeatherDaoMixin {
  WeatherDao(AppDataBase attachedDatabase) : super(attachedDatabase);

  Future<WeatherEntityData> getWeather() =>
      select(weatherEntityLocal).getSingle();

  Future<int> insertWeather(WeatherEntityLocalCompanion weatherData) =>
      into(weatherEntityLocal)
          .insert(weatherData, mode: InsertMode.insertOrReplace);
}