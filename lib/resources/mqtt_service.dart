import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  final client = MqttServerClient('10.0.2.2', 'mobile_mqtt');
  final void Function(String, String) onMessage;
  final int clientId;
   MqttService(this.clientId, this.onMessage) {
     client.onConnected = () {
       print('MQTT Connected');
       client.subscribe("client${clientId.toString()}", MqttQos.atMostOnce);
       client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
         final bufMqtt = c![0].payload as MqttPublishMessage;
         final message = MqttPublishPayload.bytesToStringAsString(bufMqtt.payload.message);
         final topic = c[0].topic;
         print('MQTT Received message: $message from topic: $topic');
         onMessage(topic, message);
       });
     };
  }

  void connect() {
    client.connect('', '');
  }
  void disconnect() {
    client.disconnect();
  }
}