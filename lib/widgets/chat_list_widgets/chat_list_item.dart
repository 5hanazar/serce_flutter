import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../screen/chat.dart';

class ChatListItem extends StatelessWidget {
  final types.Room room;
  final types.Message message;
  final TextStyle titleLarge;
  final TextStyle titleSmall;
  final TextStyle displaySmall;

  const ChatListItem({
    required this.room,
    required this.message,
    required this.titleLarge,
    required this.titleSmall,
    required this.displaySmall,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MyChat(room: room));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.id.toString(),
                      style: titleLarge,
                    ),
                    Text(
                      message.roomId.toString(),
                      style: titleSmall,
                    ),
                    if (message is types.TextMessage)
                      Text(
                        "${message.author.firstName}: ${message.id}",
                        style: titleSmall,
                      )
                    else
                      Text(
                        "",
                      ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 15, top: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: myCheckIconPrimary,
                      size: 12,
                    ),
                    Text(
                      '2 July.',
                      style: displaySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: EdgeInsets.only(top: 5, left: 10, right: 5),
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: myNotificationCountEnabledContainerPrimary,
                  ),
                  child: Center(
                    child: Text(
                      '300',
                      style: displaySmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
