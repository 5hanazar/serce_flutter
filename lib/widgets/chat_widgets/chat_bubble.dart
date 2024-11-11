import 'package:bubble/bubble.dart';
import 'package:chat_message_timestamp/chat_message_timestamp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import '../../constants/colors.dart';

// class MyCustomBubble extends StatelessWidget {
//   final types.Message message;
//   final Widget child;
//   final bool nextMessageInGroup;
//   final bool isSentByUser;

//   MyCustomBubble(
//       {Key? key,
//       required this.message,
//       required this.child,
//       required this.isSentByUser,
//       required this.nextMessageInGroup})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return

//     Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: isSentByUser ? mySecondary : myBubbleSecondary,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12),
//           bottomLeft:
//               Radius.circular(isSentByUser || nextMessageInGroup ? 12 : 0),
//           bottomRight:
//               Radius.circular(isSentByUser && nextMessageInGroup ? 12 : 0),
//         ),
//       ),
//       margin: EdgeInsets.only(bottom: nextMessageInGroup ? 0 : 10),
//       child: child,
//     );
//   }
// }

class MyCustomBubble extends StatelessWidget {
  final types.Message message;
  final Widget child;
  final bool nextMessageInGroup;
  final bool isSentByUser;
  final DateTime? previousMessageDate;

  MyCustomBubble({
    Key? key,
    required this.message,
    required this.child,
    required this.isSentByUser,
    required this.nextMessageInGroup,
    this.previousMessageDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius bubbleRadius = isSentByUser
        ? BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(isSentByUser || nextMessageInGroup ? 8 : 10),
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(isSentByUser && nextMessageInGroup ? 10 : 0))
        : BorderRadius.only(
            topLeft: Radius.circular(isSentByUser || nextMessageInGroup ? 8 : 10),
            topRight: Radius.circular(14),
            bottomLeft: Radius.circular(nextMessageInGroup ? 10 : 0),
            bottomRight: Radius.circular(14));
    return Container(
      margin: EdgeInsets.only(bottom: nextMessageInGroup ? 0 : 10),
      decoration: BoxDecoration(
          color: isSentByUser ? mySecondary : myBubbleSecondary,
          borderRadius: bubbleRadius),
      padding: const EdgeInsets.all(8.0),
      child: TimestampedChatMessage(
        maxLines: 6,
        sendingStatusIcon: Icon(
          Icons.check,
          color: Colors.white,
          size: 16,
        ),
        style: TextStyle(color: Colors.white, fontSize: 16),
        text: message is types.TextMessage
            ? (message as types.TextMessage).text
            : '',
        sentAt: '12:32',
      ),
    );
    // Container(
    // color: Colors.grey,
    //   child: Column(
    //     children: [
    //       Row(
    //         children: [child],
    //       )
    //     ],
    //   ),
    // );
  }
}
