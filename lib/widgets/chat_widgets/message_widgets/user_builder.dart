import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

Widget myCustomUserBuilder(types.User user) {
  return Container(
    child: Text(
      user.id,
      style: TextStyle(color: Colors.black),
    ),
  );
}