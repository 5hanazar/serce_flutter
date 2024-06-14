import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:serce/data/data_sources/api_serce.dart';
import 'package:serce/resources/local_notification_service.dart';
import 'package:serce/resources/mqtt_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundService {
  static final LocalNotificationService _localNotificationService = LocalNotificationService("77", "Serçe Service", 17, FlutterLocalNotificationsPlugin());
  static final _service = FlutterBackgroundService();
  static MqttService? _mqttService;

  static Future<void> init() async {
    await _localNotificationService.init();
    await _service.configure(
        androidConfiguration: AndroidConfiguration(
          onStart: _onStart,
          isForegroundMode: true,
          notificationChannelId: _localNotificationService.serviceChannelId,
          foregroundServiceNotificationId: _localNotificationService.serviceNotificationId,
          initialNotificationTitle: "Serçe is active.",
          initialNotificationContent: "Feel free to hide this notification on app settings."
        ),
        iosConfiguration: IosConfiguration());
  }
  static void launch() {
    _service.startService();
  }
  static void stop() {
    _service.invoke("stopIt");
  }
  static void listenUI(void Function(Map<String, dynamic>?)? onData) {
    _service.on("sendToUI").listen(onData);
  }
  static void _onStart(ServiceInstance service) async {
    service.on('stopIt').listen((event) {
      service.stopSelf();
    });
    final prefs = await SharedPreferences.getInstance();
    final api = SerceApi(prefs: prefs);
    int clientId = 0;
    try {
      final buf = await api.getProfile();
      clientId = buf.result.id;
    } on Exception catch (error, _) {
      if (error.toString().endsWith("405")) {
        _mqttService?.disconnect();
      }
      return;
    }
    _mqttService = MqttService(clientId, (topic, message) {
      _localNotificationService.showNotificationAndroid(topic, message, "88", "Serçe Messages", 18);
      service.invoke('sendToUI', null);
    });
    _mqttService!.connect();
  }
}
