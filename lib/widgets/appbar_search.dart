import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import 'Search_widgets/search_chats.dart';
import 'Search_widgets/search_downloads.dart';
import 'Search_widgets/search_files.dart';
import 'Search_widgets/search_input.dart';
import 'Search_widgets/search_links.dart';
import 'Search_widgets/search_music.dart';
import 'Search_widgets/search_photos.dart';
import 'Search_widgets/search_voices.dart';


class MyAppbarSearch extends StatelessWidget {
  const MyAppbarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: mySearchAppbarIcon),
            automaticallyImplyLeading: false,
            backgroundColor: mySearchAppbarPrimary,
            actions: [
              Flexible(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back)),
                    Flexible(
                      child: MySearchInput(),
                    ),
                  ],
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(150, 30),
              child: TabBar(
                unselectedLabelColor: myTabbarUnselectedPrimary,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: mySearchAppbarAccent,
                indicator: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                        color: mySecondary, width: 2.0), // Цвет нижней линии
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
          body: TabBarView(children: [
            MySearchList(),
            MySearchPhoto(),
            MySearchDownload(),
            MySearchLink(),
            MySearchFile(),
            MySearchMusic(),
            MySearchVoice(),
          ]),
        ));
  }
}
