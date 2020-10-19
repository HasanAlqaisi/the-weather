import 'package:flutter/material.dart';

String unixTimeToHours(int unixTime) {
  final date = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000, isUtc: true)
      .toLocal();

  int hour = date.hour;

  // ignore: missing_required_param
  final dayPeriod = TimeOfDay(hour: hour).period;

  if (hour == 0 || hour == 12) {
    hour = 12;
  } else {
    if (dayPeriod == DayPeriod.pm) {
      hour -= 12;
    }
  }
  return dayPeriod == DayPeriod.pm ? '$hour PM ' : '$hour AM';
}
