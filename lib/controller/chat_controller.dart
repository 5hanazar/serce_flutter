import 'dart:convert';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import '../models/chat_model.dart';

class ChatController extends GetxController {
  var messages = <types.Message>[].obs;

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  // void handlePreviewDataFetched(
  //     types.TextMessage message, types.PreviewData previewData) {
  //   final index = messages.indexWhere((element) => element.id == message.id);
  //   messages[index] = (messages[index] as types.TextMessage)
  //       .copyWith(previewData: previewData);
  // }

  void addMessage(types.Message message) {
    messages.insert(0, message);
  }

  void shandlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );
    messages[index] = updatedMessage;
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
