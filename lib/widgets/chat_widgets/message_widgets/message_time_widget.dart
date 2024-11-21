import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

// class MessageTime extends StatelessWidget {
//   final DateTime timestamp;
//   final MessageStatus status;
// final  TextStyle? style;
//   MessageTime({
//     Key? key,
//     required this.timestamp,
//     required this.status,
//     this.style = const TextStyle(fontSize: 12, color: Colors.grey),
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String formattedTime =
//         "${timestamp.hour}:${timestamp.minute}"; // Форматируем время
//     String statusText = status == MessageStatus.sent
//         ? "Sent"
//         : (status == MessageStatus.read ? "Read" : "Failed");

//     return Row(
//       children: [
//         Text(formattedTime, style: style),
//         SizedBox(width: 5),
//         Text(statusText, style: style),
//       ],
//     );
//   }
// }
// enum MessageStatus { sent, read, failed }

// class MessageTime extends StatelessWidget {
//   final DateTime timestamp;
//   final LocalMessageStatus status;
//   final TextStyle? style;

//   MessageTime({
//     Key? key,
//     required this.timestamp,
//     required this.status,
//     this.style = const TextStyle(fontSize: 12, color: Colors.grey),
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String formattedTime =
//         "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}"; // Форматируем время

//     IconData statusIcon;
//     Color iconColor = Colors.grey;

//     // Определяем иконки и цвета
//     switch (status) {
//       case LocalMessageStatus.sent:
//         statusIcon = Icons.check; // Одна галочка
//         break;
//       case LocalMessageStatus.read:
//         statusIcon = Icons.done_all; // Две галочки
//         iconColor = Colors.blue; // Синий цвет для прочитанного
//         break;
//       case LocalMessageStatus.failed:
//         statusIcon = Icons.error_outline; // Иконка ошибки
//         iconColor = Colors.red;
//         break;
//     }

//     return Row(
//       children: [
//         Text(formattedTime, style: style),
//         SizedBox(width: 5),
//         Icon(statusIcon, color: iconColor, size: 16), // Отображаем иконку
//       ],
//     );
//   }
// }

// enum LocalMessageStatus { sent, read, failed }

class MessageTime extends StatelessWidget {
  final DateTime timestamp;
  final LocalMessageStatus status;

  const MessageTime({super.key, 
    required this.timestamp,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}";

    // Иконка статуса
    IconData statusIcon;
    Color iconColor = Colors.grey;

    switch (status) {
      case LocalMessageStatus.sent:
        statusIcon = Icons.check;
        break;
      case LocalMessageStatus.read:
        statusIcon = Icons.done_all;
        iconColor = Colors.blue;
        break;
      case LocalMessageStatus.failed:
        statusIcon = Icons.error_outline;
        iconColor = Colors.red;
        break;
    }
   
    return Stack(
      alignment: Alignment.bottomRight, // Размещение в правом нижнем углу
      children: [
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(formattedTime, style: TextStyle(fontSize: 12, color: Colors.white)),
                SizedBox(width: 5),
                Icon(statusIcon, color: iconColor, size: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum LocalMessageStatus { sent, read, failed }
