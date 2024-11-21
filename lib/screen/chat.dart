import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../constants/theme/chat_theme.dart';
import '../controller/chat_controller.dart';
import '../controller/input_controller.dart';
import '../controller/more_button_controller.dart';
import '../models/chat_model.dart';
import '../widgets/chat_widgets/chat_bubble.dart';
import '../widgets/chat_widgets/chat_dateHeader.dart';
import '../widgets/chat_widgets/chat_input.dart';
import '../widgets/chat_widgets/chat_more_context_menu.dart';
import '../widgets/chat_widgets/message_widgets/avatar_builder.dart';
import '../widgets/chat_widgets/message_widgets/user_builder.dart';

class MyChat extends StatelessWidget {
  MyChat({super.key, required this.room});
  final types.Room room;
  final ChatController chatController = Get.put(ChatController());
  final MyCustomInputController inputC = Get.put(MyCustomInputController());
  final MyMoreContextMenuController moreContextMenuController =
      Get.put(MyMoreContextMenuController());

  @override
  Widget build(BuildContext context) {
    final TextStyle? labelLarge = Theme.of(context).textTheme.labelLarge;
    // final roomMessages =
    //     messages.where((msg) => msg.roomId == room.id).toList();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Obx(
              () => moreContextMenuController.isSearching.value
                  ? moreContextMenuController.buildSearchTextField(context)
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
            ),
          ],
        ),
        body: Obx(() {
          return Chat(
            showUserAvatars: false,
            // imageMessageBuilder: (imageMessage, {required messageWidth}) {
            //   messageWidth = 400;
            //   return MyCustomImageMessage(imageMessage: imageMessage, messageWidth: messageWidth);
            // },
            // imageProviderBuilder:({required conditional, required imageHeaders, required uri}) {

            //   return CachedNetworkImageProvider(uri, maxHeight: 100);
            // },

            bubbleBuilder: (child,
                {required message, required nextMessageInGroup}) {
              final currentUserId = DTO.user1.id;
              return bubbleBuilder(child,
                  message: message,
                  nextMessageInGroup: nextMessageInGroup,
                  currentUserId: currentUserId);
            },
            // customMessageBuilder: (customMessage, {required int messageWidth}) {
            //   return MyMessageWidget(message: customMessage, messageWidth: 50,);
            // },
            // customMessageBuilder: customMessageBuilder,
            onAttachmentPressed: inputC.handleImageSelection,
            theme: MyCustomChatTheme(),
            messages: inputC.messages.value,
            user: DTO.user1,
            onSendPressed: chatController.handleSendPressed,
            customBottomWidget: MyCustomInput(),
            dateHeaderBuilder: customDateHeaderBuilder,
            nameBuilder: myCustomUserBuilder,
            avatarBuilder: myCustomAvatarBuilder,
          );
        }),
      ),
    );
  }
}
