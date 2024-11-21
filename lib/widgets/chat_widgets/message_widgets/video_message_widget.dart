
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class MyVideoMessageWidget extends StatelessWidget {
  final types.VideoMessage message;

  const MyVideoMessageWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.videocam),
        SizedBox(width: 10),
        Text("Video Message", style: TextStyle(color: Colors.black)),
        // Здесь добавим свой виджет для воспроизведения видео
      ],
    );
  }
}