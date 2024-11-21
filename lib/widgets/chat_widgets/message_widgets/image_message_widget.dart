import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class MyImageMessageWidget extends StatelessWidget {
  final types.ImageMessage message;

  const MyImageMessageWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(message.uri,
        width: 200, height: 200, fit: BoxFit.cover);
  }
}

class MyAudioMessageWidget extends StatelessWidget {
  final types.AudioMessage message;

  const MyAudioMessageWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.audio_file),
        SizedBox(width: 10),
        Text("Audio Message", style: TextStyle(color: Colors.black)),
        // Здесь добавим свой виджет для проигрывания аудио
      ],
    );
  }
}