import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../constants/colors.dart';
import '../../models/chat_model.dart';
import '../../screen/chat.dart';

class MySearchList extends StatelessWidget {
  const MySearchList({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    final TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    return Column(
      children: [
        // First Listview
        Container(
          constraints: BoxConstraints(minHeight: 20, maxHeight: 80),
          child: SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, left: 5, right: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/originals/92/3e/87/923e87d72a3ffb1bc0869a2538b81f9d.jpg'),
                          // minRadius: 4,
                          radius: 25,
                          onBackgroundImageError: (exception, stackTrace) {
                            return print(
                                'Ошибка при загрузке изображения: $exception');
                          },
                        ),
                        Text(
                          'john',
                          style: titleSmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 30),
          child: Container(
            color: myrecentChatsContainerPrimary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Recent chats',
                    style: titleSmall,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        print('Clicked!');
                      },
                      child: Text(
                        'Clear',
                        style: titleSmall,
                      ),
                    )),
              ],
            ),
          ),
        ),

        // Second Listview
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                indent: 70,
              );
            },
            itemCount: 12,
            itemBuilder: (context, index) {
              final TextStyle? titleSmall =
                  Theme.of(context).textTheme.titleSmall;
              final TextStyle? displaySmall =
                  Theme.of(context).textTheme.displaySmall;
              final TextStyle? titleLarge =
                  Theme.of(context).textTheme.titleLarge;
              return Column(
                children: [
                  // On tap to chat
                  InkWell(
                    onTap: () {
                      Get.to(() => MyChat(room: DTO.rooms[1]));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'John',
                                      style: titleMedium,
                                    ),
                                    Text(
                                      'Hello serce',
                                      style: titleSmall,
                                    ),
                                    Text(
                                      'Hello serce',
                                      style: titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                                margin:
                                    EdgeInsets.only(top: 5, left: 10, right: 5),
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
            },
          ),
        ),
      ],
    );
  }
}
