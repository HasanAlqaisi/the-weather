// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class WeatherDataEntity extends DataClass
    implements Insertable<WeatherDataEntity> {
  final int id;
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final Current current;
  final List<Hourly> hourly;
  final List<Daily> daily;
  WeatherDataEntity(
      {@required this.id,
      @required this.lat,
      @required this.lon,
      @required this.timezone,
      @required this.timezoneOffset,
      @required this.current,
      @required this.hourly,
      @required this.daily});
  factory WeatherDataEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    return WeatherDataEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      lat: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      lon: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lon']),
      timezone: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}timezone']),
      timezoneOffset: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}timezone_offset']),
      current: $WeatherEntityTableTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}current'])),
      hourly: $WeatherEntityTableTable.$converter1.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}hourly'])),
      daily: $WeatherEntityTableTable.$converter2.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}daily'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lon != null) {
      map['lon'] = Variable<double>(lon);
    }
    if (!nullToAbsent || timezone != null) {
      map['timezone'] = Variable<String>(timezone);
    }
    if (!nullToAbsent || timezoneOffset != null) {
      map['timezone_offset'] = Variable<int>(timezoneOffset);
    }
    if (!nullToAbsent || current != null) {
      final converter = $WeatherEntityTableTable.$converter0;
      map['current'] = Variable<String>(converter.mapToSql(current));
    }
    if (!nullToAbsent || hourly != null) {
      final converter = $WeatherEntityTableTable.$converter1;
      map['hourly'] = Variable<String>(converter.mapToSql(hourly));
    }
    if (!nullToAbsent || daily != null) {
      final converter = $WeatherEntityTableTable.$converter2;
      map['daily'] = Variable<String>(converter.mapToSql(daily));
    }
    return map;
  }

  WeatherEntityTableCompanion toCompanion(bool nullToAbsent) {
    return WeatherEntityTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lon: lon == null && nullToAbsent ? const Value.absent() : Value(lon),
      timezone: timezone == null && nullToAbsent
          ? const Value.absent()
          : Value(timezone),
      timezoneOffset: timezoneOffset == null && nullToAbsent
          ? const Value.absent()
          : Value(timezoneOffset),
      current: current == null && nullToAbsent
          ? const Value.absent()
          : Value(current),
      hourly:
          hourly == null && nullToAbsent ? const Value.absent() : Value(hourly),
      daily:
          daily == null && nullToAbsent ? const Value.absent() : Value(daily),
    );
  }

  factory WeatherDataEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WeatherDataEntity(
      id: serializer.fromJson<int>(json['id']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
      timezone: serializer.fromJson<String>(json['timezone']),
      timezoneOffset: serializer.fromJson<int>(json['timezoneOffset']),
      current: serializer.fromJson<Current>(json['current']),
      hourly: serializer.fromJson<List<Hourly>>(json['hourly']),
      daily: serializer.fromJson<List<Daily>>(json['daily']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'timezone': serializer.toJson<String>(timezone),
      'timezoneOffset': serializer.toJson<int>(timezoneOffset),
      'current': serializer.toJson<Current>(current),
      'hourly': serializer.toJson<List<Hourly>>(hourly),
      'daily': serializer.toJson<List<Daily>>(daily),
    };
  }

  WeatherDataEntity copyWith(
          {int id,
          double lat,
          double lon,
          String timezone,
          int timezoneOffset,
          Current current,
          List<Hourly> hourly,
          List<Daily> daily}) =>
      WeatherDataEntity(
        id: id ?? this.id,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        timezone: timezone ?? this.timezone,
        timezoneOffset: timezoneOffset ?? this.timezoneOffset,
        current: current ?? this.current,
        hourly: hourly ?? this.hourly,
        daily: daily ?? this.daily,
      );
  @override
  String toString() {
    return (StringBuffer('WeatherDataEntity(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('timezone: $timezone, ')
          ..write('timezoneOffset: $timezoneOffset, ')
          ..write('current: $current, ')
          ..write('hourly: $hourly, ')
          ..write('daily: $daily')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          lat.hashCode,
          $mrjc(
              lon.hashCode,
              $mrjc(
                  timezone.hashCode,
                  $mrjc(
                      timezoneOffset.hashCode,
                      $mrjc(current.hashCode,
                          $mrjc(hourly.hashCode, daily.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WeatherDataEntity &&
          other.id == this.id &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.timezone == this.timezone &&
          other.timezoneOffset == this.timezoneOffset &&
          other.current == this.current &&
          other.hourly == this.hourly &&
          other.daily == this.daily);
}

class WeatherEntityTableCompanion extends UpdateCompanion<WeatherDataEntity> {
  final Value<int> id;
  final Value<double> lat;
  final Value<double> lon;
  final Value<String> timezone;
  final Value<int> timezoneOffset;
  final Value<Current> current;
  final Value<List<Hourly>> hourly;
  final Value<List<Daily>> daily;
  const WeatherEntityTableCompanion({
    this.id = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.timezone = const Value.absent(),
    this.timezoneOffset = const Value.absent(),
    this.current = const Value.absent(),
    this.hourly = const Value.absent(),
    this.daily = const Value.absent(),
  });
  WeatherEntityTableCompanion.insert({
    this.id = const Value.absent(),
    @required double lat,
    @required double lon,
    @required String timezone,
    @required int timezoneOffset,
    @required Current current,
    @required List<Hourly> hourly,
    @required List<Daily> daily,
  })  : lat = Value(lat),
        lon = Value(lon),
        timezone = Value(timezone),
        timezoneOffset = Value(timezoneOffset),
        current = Value(current),
        hourly = Value(hourly),
        daily = Value(daily);
  static Insertable<WeatherDataEntity> custom({
    Expression<int> id,
    Expression<double> lat,
    Expression<double> lon,
    Expression<String> timezone,
    Expression<int> timezoneOffset,
    Expression<String> current,
    Expression<String> hourly,
    Expression<String> daily,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (timezone != null) 'timezone': timezone,
      if (timezoneOffset != null) 'timezone_offset': timezoneOffset,
      if (current != null) 'current': current,
      if (hourly != null) 'hourly': hourly,
      if (daily != null) 'daily': daily,
    });
  }

  WeatherEntityTableCompanion copyWith(
      {Value<int> id,
      Value<double> lat,
      Value<double> lon,
      Value<String> timezone,
      Value<int> timezoneOffset,
      Value<Current> current,
      Value<List<Hourly>> hourly,
      Value<List<Daily>> daily}) {
    return WeatherEntityTableCompanion(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezone: timezone ?? this.timezone,
      timezoneOffset: timezoneOffset ?? this.timezoneOffset,
      current: current ?? this.current,
      hourly: hourly ?? this.hourly,
      daily: daily ?? this.daily,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (timezoneOffset.present) {
      map['timezone_offset'] = Variable<int>(timezoneOffset.value);
    }
    if (current.present) {
      final converter = $WeatherEntityTableTable.$converter0;
      map['current'] = Variable<String>(converter.mapToSql(current.value));
    }
    if (hourly.present) {
      final converter = $WeatherEntityTableTable.$converter1;
      map['hourly'] = Variable<String>(converter.mapToSql(hourly.value));
    }
    if (daily.present) {
      final converter = $WeatherEntityTableTable.$converter2;
      map['daily'] = Variable<String>(converter.mapToSql(daily.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherEntityTableCompanion(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('timezone: $timezone, ')
          ..write('timezoneOffset: $timezoneOffset, ')
          ..write('current: $current, ')
          ..write('hourly: $hourly, ')
          ..write('daily: $daily')
          ..write(')'))
        .toString();
  }
}

class $WeatherEntityTableTable extends WeatherEntityTable
    with TableInfo<$WeatherEntityTableTable, WeatherDataEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $WeatherEntityTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  GeneratedRealColumn _lat;
  @override
  GeneratedRealColumn get lat => _lat ??= _constructLat();
  GeneratedRealColumn _constructLat() {
    return GeneratedRealColumn(
      'lat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lonMeta = const VerificationMeta('lon');
  GeneratedRealColumn _lon;
  @override
  GeneratedRealColumn get lon => _lon ??= _constructLon();
  GeneratedRealColumn _constructLon() {
    return GeneratedRealColumn(
      'lon',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timezoneMeta = const VerificationMeta('timezone');
  GeneratedTextColumn _timezone;
  @override
  GeneratedTextColumn get timezone => _timezone ??= _constructTimezone();
  GeneratedTextColumn _constructTimezone() {
    return GeneratedTextColumn(
      'timezone',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timezoneOffsetMeta =
      const VerificationMeta('timezoneOffset');
  GeneratedIntColumn _timezoneOffset;
  @override
  GeneratedIntColumn get timezoneOffset =>
      _timezoneOffset ??= _constructTimezoneOffset();
  GeneratedIntColumn _constructTimezoneOffset() {
    return GeneratedIntColumn(
      'timezone_offset',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currentMeta = const VerificationMeta('current');
  GeneratedTextColumn _current;
  @override
  GeneratedTextColumn get current => _current ??= _constructCurrent();
  GeneratedTextColumn _constructCurrent() {
    return GeneratedTextColumn(
      'current',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hourlyMeta = const VerificationMeta('hourly');
  GeneratedTextColumn _hourly;
  @override
  GeneratedTextColumn get hourly => _hourly ??= _constructHourly();
  GeneratedTextColumn _constructHourly() {
    return GeneratedTextColumn(
      'hourly',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dailyMeta = const VerificationMeta('daily');
  GeneratedTextColumn _daily;
  @override
  GeneratedTextColumn get daily => _daily ??= _constructDaily();
  GeneratedTextColumn _constructDaily() {
    return GeneratedTextColumn(
      'daily',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, lat, lon, timezone, timezoneOffset, current, hourly, daily];
  @override
  $WeatherEntityTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'weather_entity_table';
  @override
  final String actualTableName = 'weather_entity_table';
  @override
  VerificationContext validateIntegrity(Insertable<WeatherDataEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat'], _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
          _lonMeta, lon.isAcceptableOrUnknown(data['lon'], _lonMeta));
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(_timezoneMeta,
          timezone.isAcceptableOrUnknown(data['timezone'], _timezoneMeta));
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('timezone_offset')) {
      context.handle(
          _timezoneOffsetMeta,
          timezoneOffset.isAcceptableOrUnknown(
              data['timezone_offset'], _timezoneOffsetMeta));
    } else if (isInserting) {
      context.missing(_timezoneOffsetMeta);
    }
    context.handle(_currentMeta, const VerificationResult.success());
    context.handle(_hourlyMeta, const VerificationResult.success());
    context.handle(_dailyMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherDataEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WeatherDataEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WeatherEntityTableTable createAlias(String alias) {
    return $WeatherEntityTableTable(_db, alias);
  }

  static TypeConverter<Current, String> $converter0 = CurrentConverter();
  static TypeConverter<List<Hourly>, String> $converter1 = HourlyConverter();
  static TypeConverter<List<Daily>, String> $converter2 = DailyConverter();
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WeatherEntityTableTable _weatherEntityTable;
  $WeatherEntityTableTable get weatherEntityTable =>
      _weatherEntityTable ??= $WeatherEntityTableTable(this);
  WeatherDao _weatherDao;
  WeatherDao get weatherDao => _weatherDao ??= WeatherDao(this as AppDataBase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [weatherEntityTable];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$WeatherDaoMixin on DatabaseAccessor<AppDataBase> {
  $WeatherEntityTableTable get weatherEntityTable =>
      attachedDatabase.weatherEntityTable;
}
