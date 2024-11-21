import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class MyFileMessageWidget extends StatelessWidget {
  final types.FileMessage message;

  const MyFileMessageWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.attach_file),
        SizedBox(width: 10),
        Text("File Message", style: TextStyle(color: Colors.black)),
        // Добавь свой виджет для скачивания или предпросмотра файла
      ],
    );
  }
}
