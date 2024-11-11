import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:bubble/bubble.dart';
import 'package:serce/controller/chat_search_controller.dart';
import '../constants/theme/chat_theme.dart';
import '../controller/chat_controller.dart';
import '../controller/input_controller.dart';
import '../models/chat_model.dart';
import '../widgets/chat_widgets/chat_bubble.dart';
import '../widgets/chat_widgets/chat_dateHeader.dart';
import '../widgets/chat_widgets/chat_input.dart';
import '../widgets/chat_widgets/chat_more_context_menu.dart';

class MyChat extends StatelessWidget {
  MyChat({super.key, required this.room});
  final types.Room room;
  final ChatController chatController = Get.put(ChatController());
  final MyCustomInputController inputC = Get.put(MyCustomInputController());
  final MySearchController searchController = Get.put(MySearchController());

  @override
  Widget build(BuildContext context) {
    final TextStyle? labelLarge = Theme.of(context).textTheme.labelLarge;
    // final roomMessages =
    //     messages.where((msg) => msg.roomId == room.id).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Obx(
        //   () => searchController.isSearching.value
        //       ? searchController.buildSearchTextField(context) // Поле поиска
        //       : Text(
        //     room.type == types.RoomType.direct
        //         ? room.users[1].firstName ?? room.name.toString()
        //         : 'Групповой чат',
        //     style: labelLarge), // Название страницы
        // ),
        actions: [
          Obx(
            () => searchController.isSearching.value
                ? searchController.buildSearchTextField(context)
                : Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                room.users[1].firstName.toString(),
                                style: labelLarge,
                              ),
                            ),
                          ],
                        ),
                        MyMoreContextMenu(),
                      ],
                    ),
                  ),
          )
        ],
      ),
      body: Obx(() {
        return Chat(
          showUserAvatars: false,

          bubbleBuilder: (child,
              {required message, required nextMessageInGroup}) {
            bool isLastInGroup = nextMessageInGroup;

            return MyCustomBubble(
              message: message,
              nextMessageInGroup: isLastInGroup,
              isSentByUser: message.author.id == 'user1',
              child: child,
            );
          },
          // systemMessageBuilder: ,
          // bubbleBuilder: (child,
          //     {required message, required nextMessageInGroup}) {
          //   bool isLastInGroup = nextMessageInGroup;

          //   return MyCustomBubble(
          //     message: message,
          //     nextMessageInGroup: isLastInGroup,
          //     isSentByUser: message.author.id == 'user1',
          //     child: child,
          //   );
          // },
          theme: MyCustomChatTheme(),
          messages: inputC.messages.value,
          user: DTO.user1,
          onSendPressed: chatController.handleSendPressed,
          customBottomWidget: MyCustomInput(),
          dateHeaderBuilder: customDateHeaderBuilder,
          nameBuilder: myCustomUserBuilder,
          // dateHeaderThreshold: ,
          avatarBuilder: myCustomAvatarBuilder,
          // customDateHeaderText: ,
        );
      }),
    );
  }
}

Widget myCustomUserBuilder(types.User user) {
  return Container(
    child: Text(
      user.id,
      style: TextStyle(color: Colors.black),
    ),
  );
}

Widget myCustomAvatarBuilder(types.User user) {
  return Container(
    child: Text(
      user.id,
      style: TextStyle(color: Colors.black),
    ),
  );
}
