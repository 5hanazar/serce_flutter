import 'package:flutter/material.dart';

class MySearchPhoto extends StatelessWidget {
  const MySearchPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(2),
            child: Container(
              height: 50,
              width: 50,
              color: Colors.amber,
            ),
          );
        });
  }
}
