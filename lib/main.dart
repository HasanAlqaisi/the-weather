import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather/features/weather/presentation/bloc/weather_bloc.dart';

import 'features/weather/presentation/pages/welcome_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(
    BlocProvider(
        create: (BuildContext context) => di.sl<WeatherBloc>(),
        child: WelcomeScreen()),
  );
}
