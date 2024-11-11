import 'package:chat_message_timestamp/chat_message_timestamp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Fonta extends StatelessWidget {
  const Fonta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: FaIcon(FontAwesomeIcons.cartPlus))
          ],
        ),
        body: Container(
        decoration: BoxDecoration(color: Colors.grey),
          padding: const EdgeInsets.all(15.0),
          child: TimestampedChatMessage(
          sendingStatusIcon: Icon(Icons.check, color: Colors.white, size: 16,),
          style: TextStyle(color: Colors.white, fontSize: 16),
            text: 'your message here',
            sentAt: '12:32',
          ),
        ),);
  }
}
