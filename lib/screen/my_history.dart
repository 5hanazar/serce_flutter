import 'package:flutter/material.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
              ),
              Column(
                children: [
                  Text('My history'),
                  Text('3 sended history'),
                ],
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [],
        ),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.amber,
              ),
            );
          }),
    );
  }
}
