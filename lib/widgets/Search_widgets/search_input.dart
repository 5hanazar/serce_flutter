import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class MySearchInput extends StatelessWidget {
  MySearchInput({super.key});
  @override
  Widget build(BuildContext context) {
    final TextStyle? inputLabel = Theme.of(context).textTheme.labelMedium;
    return Container(
        margin: EdgeInsets.all(5),

        child: TextField(
          style: TextStyle(color: mySearchInputText),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search...',
            fillColor: myPrimary,
            hintStyle: inputLabel,
            suffixIcon: IconButton(
              color: mySearchAppbarIcon,
              icon: Icon(Icons.close),
              onPressed: () {
          
              },
            ),
          ),
        ));
  }
}
