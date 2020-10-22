import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:the_weather/core/responsivness/size_config.dart';
import 'package:the_weather/core/utils/constants.dart';
import 'package:the_weather/core/utils/unit_time_to_day.dart';
import 'package:the_weather/core/utils/unix_time_to_hour.dart';
import 'package:the_weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:the_weather/features/weather/presentation/widgets/hourly_temp.dart';
import 'package:the_weather/features/weather/presentation/widgets/input_city_dialog.dart';
import 'package:the_weather/features/weather/presentation/widgets/weekly_temp.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherState = BlocProvider.of<WeatherBloc>(context).state;
    final weatherData =
        weatherState is Loaded ? weatherState.weatherEntity : null;
    final date = DateFormat.MMMEd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff4b5cc2),
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.white,
        // ),
        title: Text(date,
            style: kBrightTextStyle.copyWith(
                fontSize: 1.89 * SizeConfig.textMultiplier)),
        centerTitle: true,
        // actions: [
        //   Icon(Icons.location_on),
        //   Padding(
        //     padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        //     child: GestureDetector(
        //       child: Icon(Icons.add),
        //       onTap: () {
        //         showDialog(context: context, builder: (context) => InputCityDialog() );
        //       },
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 5.0 * SizeConfig.heightMultiplier),
              child: Text(
                weatherData.timezone.split('/')[1],
                style: kBrightTextStyle.copyWith(
                    fontSize: 2.4 * SizeConfig.textMultiplier),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weatherData.current.temp.toInt()}°',
                  style: TextStyle(
                    fontSize: 6.4 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Image(
                  image: NetworkImage(
                      'http://openweathermap.org/img/wn/${weatherData.current.weather[0].icon}@2x.png'),
                  width: 19.46 * SizeConfig.imageSizeMultiplier,
                  height: 24.33 * SizeConfig.imageSizeMultiplier,
                ),
              ],
            ),
            SizedBox(height: 2.53 * SizeConfig.heightMultiplier),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.red,
                  size: 6.8 * SizeConfig.imageSizeMultiplier,
                ),
                Text('${weatherData.daily.first.temp.max.toInt()}°',
                    style: kBrightTextStyle),
                SizedBox(width: 2.43 * SizeConfig.widthMultiplier),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.green,
                  size: 6.8 * SizeConfig.imageSizeMultiplier,
                ),
                Text('${weatherData.daily.first.temp.min.toInt()}°',
                    style: kBrightTextStyle),
                SizedBox(width: 4.38 * SizeConfig.widthMultiplier)
              ],
            ),
            SizedBox(height: 5 * SizeConfig.heightMultiplier),
            // Text('Sunny', style: kDimTextStyle, textAlign: TextAlign.center),
            // SizedBox(height: 5.0),
            // Text('Feels like 29°', style: kDimTextStyle, textAlign: TextAlign.center),
            // SizedBox(height: 20.0),
            Divider(thickness: 0.4, color: Colors.white),
            Container(
              height: 12.65 * SizeConfig.heightMultiplier,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final unixTime = weatherData.hourly[index].dt;
                  return HourlyTemp(
                      hour: unixTimeToHours(unixTime),
                      temp: weatherData.hourly[index].temp);
                },
                itemCount: 12,
              ),
            ),
            Divider(thickness: 0.4, color: Colors.white),
            SizedBox(height: 2.53 * SizeConfig.heightMultiplier),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final unixTime = weatherData.daily[index].dt;
                return WeeklyTemp(
                  day: unixTimeToDay(unixTime),
                  humidity: weatherData.daily[index].humidity,
                  maxTemp: weatherData.daily[index].temp.max.toInt(),
                  minTemp: weatherData.daily[index].temp.min.toInt(),
                  icon: weatherData.current.weather[0].icon,
                );
              },
              itemCount: weatherData.daily.length,
            )
          ],
        ),
      ),
    );
  }
}
