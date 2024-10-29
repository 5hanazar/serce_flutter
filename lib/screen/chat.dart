import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../constants/theme/chat_theme.dart';
import '../controller/chat_controller.dart';
import '../controller/input_controller.dart';
import '../models/chat_model.dart';
import '../widgets/chat_input/input.dart';


class MyChat extends StatelessWidget {
  MyChat({super.key, required this.room});
  final types.Room room;
  final ChatController chatController = Get.put(ChatController());
  final MyCustomInputController inputC = Get.put(MyCustomInputController());

  @override
  Widget build(BuildContext context) {
    // final roomMessages =
    //     messages.where((msg) => msg.roomId == room.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(room.type == types.RoomType.direct
            ? room.users[0].lastName ?? room.name.toString()
            : 'Групповой чат'),
      ),
      body: Obx(() {
        return Chat(
          theme: MyCustomChatTheme(),
          messages: inputC.messages.value,
          user: DTO.user1,
          onSendPressed: chatController.handleSendPressed,
          customBottomWidget: MyCustomInput(),
        );
      }),
    );
  }
}
