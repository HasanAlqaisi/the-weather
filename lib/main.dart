import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as db;
import 'package:the_weather/core/utils/constants.dart';
import 'package:the_weather/features/weather/presentation/bloc/weather_bloc.dart';

import 'features/weather/presentation/pages/welcome_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Future<db.Database> database = db.openDatabase(
    path.join(await db.getDatabasesPath(), tableName),
    onCreate: (database, version) {
      return database.execute(createTableSql);
    },
    version: 1,
  );

  di.init();

  runApp(
    BlocProvider(
        create: (BuildContext context) => di.sl<WeatherBloc>(),
        child: WelcomeScreen()),
  );
}
