String unixTimeToDay(int unixTime) {
  switch (DateTime.fromMillisecondsSinceEpoch(unixTime * 1000, isUtc: true)
      .weekday) {
    case DateTime.monday:
      return 'Monday';
      break;
    case DateTime.tuesday:
      return 'Tuesday';
      break;
    case DateTime.wednesday:
      return 'Wednesday';
      break;
    case DateTime.thursday:
      return 'Thursday';
      break;
    case DateTime.friday:
      return 'Friday';
      break;
    case DateTime.saturday:
      return 'Saturday';
      break;
    case DateTime.sunday:
      return 'Sunday';
      break;
    default:
      return 'Day';
  }
}
