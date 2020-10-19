import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

import '../current.dart';
import '../daily.dart';
import '../hourly.dart';

part 'weather_entity_table.g.dart';

@DataClassName('WeatherDataEntity')
class WeatherEntityTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get lat => real()();
  RealColumn get lon => real()();
  TextColumn get timezone => text()();
  IntColumn get timezoneOffset => integer()();
  TextColumn get current => text().map(CurrentConverter())();
  TextColumn get hourly => text().map(HourlyConverter())();
  TextColumn get daily => text().map(DailyConverter())();
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

@UseMoor(tables: [WeatherEntityTable], daos: [WeatherDao])
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [WeatherEntityTable])
class WeatherDao extends DatabaseAccessor<AppDataBase> with _$WeatherDaoMixin {
  WeatherDao(AppDataBase attachedDatabase) : super(attachedDatabase);

  Future<WeatherDataEntity> getWeather() =>
      select(weatherEntityTable).getSingle();

  Future<int> insertWeather(Insertable<WeatherDataEntity> weatherData) =>
      into(weatherEntityTable)
          .insert(weatherData, mode: InsertMode.insertOrReplace);
}
