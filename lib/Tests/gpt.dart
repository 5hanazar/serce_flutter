import 'package:flutter/material.dart';

class MyAppBarWithScroll extends StatefulWidget {
  @override
  _MyAppBarWithScrollState createState() => _MyAppBarWithScrollState();
}

class _MyAppBarWithScrollState extends State<MyAppBarWithScroll> {
  final ScrollController _scrollController = ScrollController();
  double _circleSize = 30; // Начальный размер кружочков

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        // Изменяем размер кружочков в зависимости от прокрутки
        _circleSize = 30 + (_scrollController.offset / 10).clamp(0, 50);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomScrollView AppBar'),
        actions: [
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _circleSize,
                width: _circleSize,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text('A', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 8),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _circleSize,
                width: _circleSize,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text('B', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 8),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _circleSize,
                width: _circleSize,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text('C', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 800, // Увеличенная высота для демонстрации прокрутки
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: 20, // Количество элементов
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                    leading: Icon(Icons.star),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

