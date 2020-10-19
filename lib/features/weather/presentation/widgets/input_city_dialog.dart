import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_weather/features/weather/presentation/bloc/weather_bloc.dart';

class InputCityDialog extends StatefulWidget {
  @override
  _InputCityDialogState createState() => _InputCityDialogState();
}

class _InputCityDialogState extends State<InputCityDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String _cityName = '';
    // TextEditingController controller = TextEditingController();
    // bool error = false;
    return AlertDialog(
      title: Text('Enter a city name'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          autofocus: true,
          onChanged: (city) {
            _cityName = city;
          },
          validator: (city) {
            if (city.isEmpty || city == null) {
              return 'Enter a valid city name';
            }
            return null;
          },
        ),
      ),
      actions: [
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              BlocProvider.of<WeatherBloc>(context)
                  .add(GetWeatherByNamingEvent(_cityName));
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
