import 'package:flutter/material.dart';
import 'package:the_weather/core/utils/constants.dart';

class HourlyTemp extends StatelessWidget {
  final hour, temp;

  const HourlyTemp({Key key, @required this.hour, @required this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            '$hour',
            style: TextStyle(color: Colors.grey[350]),
          ),
          SizedBox(height: 15.0),
          Text(
            '${temp.toInt()}°',
            style: kBoldBrightTextStyle,
          )
        ],
      ),
    );
  }
}
