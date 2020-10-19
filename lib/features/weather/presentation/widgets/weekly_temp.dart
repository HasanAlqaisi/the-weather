import 'package:flutter/material.dart';
import 'package:the_weather/core/utils/constants.dart';

class WeeklyTemp extends StatelessWidget {
  final String day, icon;
  final int humidity, maxTemp, minTemp;

  const WeeklyTemp(
      {Key key, this.day, this.humidity, this.maxTemp, this.minTemp, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: 110,
              child:
                  Text(day, style: kBrightTextStyle.copyWith(fontSize: 18.0))),
          Container(
            width: 110,
            child: Row(
              children: [
                Image(
                  image: NetworkImage(
                      'http://openweathermap.org/img/wn/$icon@2x.png'),
                      width: 40.0,
                      height: 40.0,
                ),
                SizedBox(width: 10.0),
                Text('$humidity%', style: kDimTextStyle),
              ],
            ),
          ),
          Container(
            width: 50,
            child: Row(
              children: [
                Text(maxTemp.toString(), style: kBrightTextStyle),
                SizedBox(width: 10.0),
                Text(minTemp.toString(), style: kDimTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
