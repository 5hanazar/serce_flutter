import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../models/chat_model.dart';

class ChatController extends GetxController {
  var messages = <types.Message>[].obs;

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void addMessage(types.Message message) {
    messages.insert(0, message);
    
    
  }


  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: DTO.user1,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

  addMessage(textMessage);
}
}