import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../models/chat_model.dart';

// class MyCustomInputController extends GetxController {
//   var messageText = ''.obs;

//   void sendMessage() {
//     if (messageText.isNotEmpty) {
//       print("Отправлено сообщение: ${messageText.value}");
//       messageText.value = '';
//     }
//   }
// }

class MyCustomInputController extends GetxController {
  final textController = TextEditingController().obs;
  final systemMessage = types.SystemMessage(
    id: 'unique_id',
    text: 'Пользователь присоединился к чату',
  );
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

  void handleSend() {
    if (textController.value.text.isNotEmpty) {
      final partialText = types.PartialText(text: textController.value.text);
      textController.value.clear();
      // onSend(partialText);
      handleSendPressed(partialText);
      isSendButtonVisible.value = false;
    }
  }

  @override
  void onClose() {
    textController.value.dispose();
    super.onClose();
  }

  // Переменная для отслеживания видимости кнопки отправки
  final isSendButtonVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Добавляем слушатель для текстового контроллера
    textController.value.addListener(() {
      isSendButtonVisible.value = textController.value.text.isNotEmpty;
    });
  }

  void handleFileSelection() {
    // Логика для выбора файла
    print("Открыть выбор файла");
  }
}
