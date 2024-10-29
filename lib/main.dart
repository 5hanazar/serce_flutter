import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
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
          seedColor: myprimary,
          primary: myprimary,
          secondary: mysecondary,
          onPrimary: mysecondary,
          brightness: Brightness.light,
          onSurface: mysecondary,
        ),

        // Divider indent isnt dynamic
        dividerTheme: DividerThemeData(
          space: 5,
          color: mydividerPrimary,
          thickness: 0.5,
          indent: 80,
        ),
        iconTheme: IconThemeData(color: Colors.grey.shade600),
        textTheme: TextTheme(
          titleSmall:
              TextStyle(color: mysubTitlePrimary, fontSize: titleSmallFontSize),
          titleMedium:
              TextStyle(color: mytextPrimary, fontSize: titleMediumFontSize),
          titleLarge: TextStyle(
              color: mytitleLargePrimary,
              fontSize: titleLargeFontSize,
              fontWeight: FontWeight.bold),
          labelSmall: TextStyle(
              color: mynotificationCountPrimary,
              fontSize: labelSmallFontSize,
              fontWeight: FontWeight.bold),
          labelMedium: TextStyle(
              color: mysearchInputPrimary, fontSize: labelMediumFontSize),
          displaySmall: TextStyle(
              color: mydateInTrailingPrimary,
              fontSize: displaySmallFontSize,
              fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: myprimary,
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          tabAlignment: TabAlignment.start,
          labelColor: mytabbarSelectedPrimary,
          unselectedLabelColor: mytabbarUnselectedPrimary,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: mysecondary,
            iconTheme: IconThemeData(color: secondary)),
        drawerTheme: DrawerThemeData(),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyChatList(),
    );
  }
}
