import 'package:flutter/material.dart';
import 'package:the_weather/features/weather/presentation/bloc/weather_bloc.dart';

void showInfiniteSnack(
    {BuildContext context,
    Error state,
    String text,
    String actionLable,
    Function() onPressed}) async {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(days: 365),
      action: SnackBarAction(
        label: actionLable,
        onPressed: onPressed,
      ),
    ),
  );
}
