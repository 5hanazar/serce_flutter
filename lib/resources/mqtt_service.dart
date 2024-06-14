import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  final _client = MqttServerClient('10.0.2.2', 'mobile_mqtt');
  bool isConnected() {
    return _client.connectionStatus?.state == MqttConnectionState.connected;
  }
  void connect(int clientId, void Function(String, String) onMessage) {
    _client.onConnected = () {
      print('MQTT Connected');
      _client.subscribe("client${clientId.toString()}", MqttQos.atMostOnce);
      _client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final bufMqtt = c![0].payload as MqttPublishMessage;
        final message = MqttPublishPayload.bytesToStringAsString(bufMqtt.payload.message);
        final topic = c[0].topic;
        print('MQTT Received message: $message from topic: $topic');
        onMessage(topic, message);
      });
    };
    _client.connect('', '');
  }
  void disconnect() {
    _client.disconnect();
  }
  /*void _doAutoReconnect() {
    return _client.doAutoReconnect();
  }
  void _onDisconnected(void Function() func) {
    _client.onDisconnected = func;
  }*/
}