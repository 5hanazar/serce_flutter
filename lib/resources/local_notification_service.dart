import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  const LocalNotificationService(this.serviceChannelId, this.serviceChannelName, this.serviceNotificationId, this._flutterLocalNotificationsPlugin);
  final String serviceChannelId;
  final String serviceChannelName;
  final int serviceNotificationId;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    final channel = AndroidNotificationChannel(serviceChannelId, serviceChannelName, importance: Importance.low, showBadge: false);
    await _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
  }

  void showNotificationAndroid(String title, String value, String notificationChannelId, String notificationChannelName, int notificationId) async {
    /*const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(notificationChannelId, notificationChannelName, channelDescription: 'Channel Description', importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(notificationId, title, value, notificationDetails, payload: 'Not present');*/

    final androidNotificationDetails = AndroidNotificationDetails(notificationChannelId, notificationChannelName, importance: Importance.high, priority: Priority.high);
    await _flutterLocalNotificationsPlugin.show(notificationId, title, value, NotificationDetails(android: androidNotificationDetails));
  }
}
