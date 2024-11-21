import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTime extends StatelessWidget {
  final DateTime timestamp; // Время в виде DateTime
  final MessageStatus status; // Статус сообщения
  final Color timeColor;
  final double fontSize;

  const MessageTime({
    Key? key,
    required this.timestamp,
    required this.status,
    this.timeColor = Colors.grey,
    this.fontSize = 12,
  }) : super(key: key);

  bool _is12HourFormat() {
    // Проверяет, содержит ли локаль "a" (AM/PM)
    return DateFormat('j').pattern!.contains('a');
  }

  String _formatTime() {
    final is12Hour = _is12HourFormat();
    return DateFormat(is12Hour ? 'h:mm a' : 'HH:mm').format(timestamp);
  }

  IconData _getStatusIcon() {
    switch (status) {
      case MessageStatus.sent:
        return Icons.check;
      case MessageStatus.read:
        return Icons.circle;
      case MessageStatus.error:
        return Icons.error;
      default:
        return Icons.check;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedTime = _formatTime();

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          formattedTime,
          style: TextStyle(
            color: timeColor,
            fontSize: fontSize,
          ),
        ),
        const SizedBox(width: 4),
        Icon(
          _getStatusIcon(),
          color: status == MessageStatus.error ? Colors.red : timeColor,
          size: fontSize + 2,
        ),
      ],
    );
  }
}

enum MessageStatus { sent, read, error }
