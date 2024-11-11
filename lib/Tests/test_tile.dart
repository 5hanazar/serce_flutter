import 'package:flutter/material.dart';
import 'package:serce/Tests/custom_list_tile.dart';

class TestTile1 extends StatelessWidget {
  const TestTile1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return CustomListTile(
            padding: EdgeInsets.all(0),
height: 100,

            onTap: (){print('Hello');},
            
            );
          }),
    );
  }
}
