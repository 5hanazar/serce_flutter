// import 'package:flutter/material.dart';
// import 'package:tutorial/screen/chat_list.dart';
// import 'package:tutorial/widgets/chats_tabbar.dart';

// class MyTabBar extends StatelessWidget {
//   const MyTabBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 0,
//       length: 1,
//       child: Scaffold(
//         appBar: AppBar(
//           actions: [
//             Flexible(
//               child: Container(
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.menu),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//           bottom: mySizeofSearchTabBar(),
//         ),
//         body: TabBarView(children: [Text('All')],),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';


class MySliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 7,
        initialIndex: 0,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
            automaticallyImplyLeading: false,
              expandedHeight: 150.0,
              floating: false,
              pinned: true,
              actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                Flexible(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CircleAvatar(
                        radius: 15,
                          backgroundColor: Colors.amber,
                        );
                      }),
                )
              ],
              bottom: PreferredSize(
                preferredSize: Size(150, 30),
                child: TabBar(
                  unselectedLabelColor: mytabbarUnselectedPrimary,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: mysearchappbaraccent,
                  indicator: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      bottom: BorderSide(
                          color: mysecondary, width: 2.0), // Цвет нижней линии
                    ),
                  ),
                  isScrollable: true,
                  tabs: [
                    SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Chats',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Media',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Downloads',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Links',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Files',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Music',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Tab(
                        text: 'Voice',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item #$index'),
                  );
                },
                childCount: 100, // Количество элементов списка
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(

          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Container(
        decoration: BoxDecoration(
          // Применение линейного градиента
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              mysecondary, // Начальный цвет (фиолетовый)
              Color.fromARGB(
                  255, 170, 138, 197), // Средний цвет (светло-фиолетовый)
              myprimary, // Конечный цвет (серый)
            ],
          ),
        ),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // ListTile(
            //   title: const Text('Home'),
            //   selected: menuC.selectedIndex.value == 0,
            //   onTap: () {
            //     // Update the state of the app
            //     menuC.onItemTapped(0);
            //     // Then close the drawer
            //     Get.back();
            //   },
            // ),
            // ListTile(
            //   title: const Text('Business'),
            //   selected: menuC.selectedIndex.value == 1,
            //   onTap: () {
            //     // Update the state of the app
            //     menuC.onItemTapped();
            //     // Then close the drawer
            //     Get.back();
            //   },
            // ),
          ],
        ),
      )),
    );
  }
}

void main() => runApp(MaterialApp(home: MySliverAppBar()));
