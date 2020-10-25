import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class WeatherNotificationDetails {
  static NotificationDetails getNotificationDetails() {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1',
      'Weather',
      'To get hourly update for the weather',
      importance: Importance.high,
      priority: Priority.high,
      channelShowBadge: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    return platformChannelSpecifics;
  }
}
