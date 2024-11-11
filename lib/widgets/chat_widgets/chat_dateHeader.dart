import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/src/models/date_header.dart';

import '../../constants/colors.dart';

Widget customDateHeaderBuilder(DateHeader dateHeader) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Center(
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: myDateHeaderContainer
        ),
        child: Text(
          dateHeader.text, // Используем текст заголовка
          style: TextStyle(
            fontSize: 14,
            color: myDateHeaderLabel,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}