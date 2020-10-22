import 'package:flutter/material.dart';
import 'package:the_weather/core/responsivness/size_config.dart';
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
      padding: EdgeInsets.symmetric(
        vertical: 1.64 * SizeConfig.heightMultiplier,
        horizontal: 3.65 * SizeConfig.widthMultiplier,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                day,
                style: kBrightTextStyle.copyWith(
                  fontSize: 2.5 * SizeConfig.textMultiplier,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(
                      'http://openweathermap.org/img/wn/$icon@2x.png'),
                  width: 9.7 * SizeConfig.imageSizeMultiplier,
                  height: 9.7 * SizeConfig.imageSizeMultiplier,
                ),
                SizedBox(width: 5.0),
                Text('$humidity%', style: kDimTextStyle.copyWith(
                    fontSize: 2.4 * SizeConfig.textMultiplier)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(maxTemp.toString(), style: kBrightTextStyle.copyWith(
                    fontSize: 2.4 * SizeConfig.textMultiplier)),
                SizedBox(width: 15.0),
                Text(minTemp.toString(), style: kDimTextStyle.copyWith(
                    fontSize: 2.4 * SizeConfig.textMultiplier)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
