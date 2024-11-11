import 'package:flutter/material.dart';

import '../../models/chat_model.dart';
import 'chat_list_item.dart';

class ChatListItems extends StatelessWidget {
  const ChatListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleLarge = Theme.of(context).textTheme.titleLarge!;
    final TextStyle titleSmall = Theme.of(context).textTheme.titleSmall!;
    final TextStyle displaySmall = Theme.of(context).textTheme.displaySmall!;

    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          indent: 50,
        );
      },
      itemCount: DTO.rooms.length,
      itemBuilder: (context, index) {
        final message = DTO.chatHistoryRoom[index];
        final room = DTO.rooms[index];

        return ChatListItem(
          room: room,
          message: message,
          titleLarge: titleLarge,
          titleSmall: titleSmall,
          displaySmall: displaySmall,
        );
      },
    );
  }
}

