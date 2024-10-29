import 'package:flutter/material.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:serce/screen/chat.dart';

import '../constants/colors.dart';
import '../controller/chat_controller.dart';
import '../controller/menu_controller.dart';
import '../models/chat_model.dart';
import '../widgets/appbar_search.dart';


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
            child: ListView.separated(
                separatorBuilder: (context, index) {

                  return Divider(
                    indent: 50,
                  );
                },
                // itemCount: DTO.rooms.length,
                itemCount: DTO.rooms.length,
                itemBuilder: (context, index) {
                  final message = DTO.chatHistoryRoom[index];
                  types.Room roomId = DTO.rooms[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => MyChat(
                              room: DTO.rooms[index]));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DTO.rooms[index].id.toString(),
                                        style: titleLarge,
                                      ),
                                      Text(
                                        DTO.chatHistoryRoom[index].roomId
                                            .toString(),
                                        style: titleSmall,
                                      ),
                                      if (message
                                          is types.TextMessage)
                                        Text(
                                          "${message.author.firstName}: ${message.text}",
                                          style: titleSmall,
                                        )
                                      else
                                        Text(
                                          "",
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 15, top: 5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: checkIconPrimary,
                                        size: 12,
                                      ),
                                      Text(
                                        '2 July.',
                                        style: displaySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 5, left: 10, right: 5),
                                    width: 30,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            mynotificationCountEnabledContainerPrimary),
                                    child: Center(
                                        child: Text(
                                      '300',
                                      style: displaySmall,
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
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
