import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serce/widgets/chat_list_widgets/drawer.dart';

import '../constants/colors.dart';
import '../controller/chat_controller.dart';
import '../controller/menu_controller.dart';
import '../widgets/appbar_search.dart';
import '../widgets/chat_list_widgets/chat_list_items.dart';
import '../widgets/chat_list_widgets/drawer_header.dart';

class MyChatList extends StatelessWidget {
  MyChatList({super.key});
  final ChatController chatController = Get.put(ChatController());
  final MyMenuController menuC = Get.put(MyMenuController());
  @override
  Widget build(BuildContext context) {
    final TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    final TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    final TextStyle? labelSmall = Theme.of(context).textTheme.labelSmall;
    final TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall;
    final TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    final List<Widget> headerDrawer = [HeaderDrawer()];

    final List<Widget> drawerAccount = [
      ListTile(
        contentPadding: EdgeInsets.only(left: 10, right: 10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            'https://www.mansory.com/sites/default/files/styles/1920x800_fullwidth_car_slider/public/migrated/cars/Cars/lamborghini/carbonado/mansory_lamborghini_aventador_carbonado_03.jpg?h=288a8269&itok=M8OxNTRm',
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Text('Eziz'),
        trailing: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            // margin: EdgeInsets.only(
            //     top: 5, left: 10, right: 5),
            width: 30,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myNotificationCountEnabledContainerPrimary),
            child: Center(
                child: Text(
              '300',
              style: displaySmall,
            )),
          ),
        ),
      )
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => MyAppbarSearch());
            },
            icon: Icon(Icons.search),
            iconSize: 24,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatListItems(),
          ),
        ],
      ),
      drawer: MyDrawer(
        headerDrawer: headerDrawer,
        drawerAccount: drawerAccount,
      ),
    );
  }
}
