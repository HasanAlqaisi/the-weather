import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:the_weather/core/error/exception.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:the_weather/core/utils/infinite_snack.dart';
import 'package:the_weather/core/utils/message_to_failure_mapper.dart';
import 'package:the_weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:the_weather/features/weather/presentation/pages/main_page.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(GetWeatherByCoordinatesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff4b5cc2),
      ),
      home: Scaffold(
        // backgroundColor: Color(0xff4b5cc2),
        body: BlocConsumer<WeatherBloc, WeatherState>(
          builder: (BuildContext context, state) {
            return Center(child: Lottie.asset('assets/launch_screen.json'));
          },
          listener: (BuildContext context, state) {
            if (state is Loaded) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                        value: context.bloc<WeatherBloc>(), child: MainPage()),
                  ));
            } else if (state is Error) {
              if (state.failure is PermissionDeniedFailure) {
                showInfiniteSnack(
                    context: context,
                    state: state,
                    text: mapMessgeToFailure(state.failure),
                    actionLable: 'Settings',
                    onPressed: () async {
                      if (await openAppSettings()) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          _refreshWelcomePageIos();
                        }
                      }
                    });
              } else if (state.failure is LocationServiceOffFailure) {
                showInfiniteSnack(
                    context: context,
                    state: state,
                    text: mapMessgeToFailure(state.failure),
                    actionLable: 'GPS',
                    onPressed: () async {
                      if (await openLocationSettings()) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          _refreshWelcomePageIos();
                        }
                      }
                    });
              } else {
                if (state.failure is PermissionInProgressFailure) {
                  showInfiniteSnack(
                      context: context,
                      state: state,
                      text: mapMessgeToFailure(state.failure));
                } else if (state.failure is PermissionSetUpNotDone) {
                  showInfiniteSnack(
                      context: context,
                      state: state,
                      text: mapMessgeToFailure(state.failure));
                } else if (state.failure is CacheFailure) {
                  showInfiniteSnack(
                    context: context,
                    state: state,
                    text: mapMessgeToFailure(state.failure),
                  );
                }
              }
            }
          },
        ),
      ),
    );
  }

  Future _refreshWelcomePageIos() => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
}
