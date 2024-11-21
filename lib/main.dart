import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:serce/Tests/chats_tapbar1.dart';
import 'package:serce/Tests/gpt.dart';
import 'package:serce/Tests/tabbar_tes.dart';
import 'package:serce/Tests/test1.dart';
import 'package:serce/Tests/test_tile.dart';
import 'package:serce/screen/chat_list.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: myPrimary,
          primary: myPrimary,
          secondary: mySecondary,
          onPrimary: mySecondary,
          brightness: Brightness.light,
          onSurface: mySecondary,
        ),

        // Divider indent isnt dynamic
        dividerTheme: DividerThemeData(
          space: 5,
          color: myDividerPrimary,
          thickness: 0.5,
          indent: 80,
        ),
        iconTheme: IconThemeData(color: myIcons),
        textTheme: TextTheme(
            titleSmall: TextStyle(
                color: mySubTitlePrimary, fontSize: titleSmallFontSize),
            titleMedium:
                TextStyle(color: myTextPrimary, fontSize: titleMediumFontSize),
            titleLarge: TextStyle(
                color: myTitleLargePrimary,
                fontSize: titleLargeFontSize,
                fontWeight: FontWeight.w400),
            labelSmall: TextStyle(
                color: myNotificationCountPrimary,
                fontSize: labelSmallFontSize,
                fontWeight: FontWeight.bold),
            labelMedium: TextStyle(
                color: mySearchInputPrimary, fontSize: labelMediumFontSize),
            labelLarge:
                TextStyle(color: myAppbarLabel, fontSize: labelLargeFontSize),
            displaySmall: TextStyle(
              color: myDateInTrailingPrimary,
              fontSize: displaySmallFontSize,
              fontWeight: FontWeight.bold,
            ),
            displayMedium:
                TextStyle(color: myAppbarLabel, fontSize: labelMediumFontSize)),
        scaffoldBackgroundColor: myPrimary,
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          // tabAlignment: TabAlignment.start,
          labelColor: myTabbarSelectedPrimary,
          unselectedLabelColor: myTabbarUnselectedPrimary,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: mySecondary,
            iconTheme: IconThemeData(color: secondary)),
        drawerTheme: DrawerThemeData(),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyChatList(),
    );
  }
}
