import 'package:flutter/material.dart';
import 'package:the_weather/core/responsivness/size_config.dart';
import 'package:the_weather/core/utils/constants.dart';

class HourlyTemp extends StatelessWidget {
  final hour, temp;

  const HourlyTemp({Key key, @required this.hour, @required this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.86 * SizeConfig.imageSizeMultiplier),
      child: Column(
        children: [
          Text(
            '$hour',
            style: TextStyle(color: Colors.grey[350], fontSize: 1.6 * SizeConfig.textMultiplier),
          ),
          SizedBox(height: 1.89 * SizeConfig.heightMultiplier),
          Text(
            '${temp.toInt()}°',
            style: kBoldBrightTextStyle.copyWith(
                    fontSize: 2.4 * SizeConfig.textMultiplier),
          )
        ],
      ),
    );
  }
}
