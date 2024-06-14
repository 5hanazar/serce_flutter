import 'package:serce/data/data_sources/api_serce.dart';
import 'package:serce/data/repository.dart';
import 'package:serce/presentation/pages/page_rooms.dart';
import 'package:serce/resources/background_service.dart';
import 'package:serce/resources/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serce/resources/controller_room.dart';
import 'package:serce/resources/controller_rooms.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*final localNotificationService = LocalNotificationService("77", "Serçe Channel", 17, FlutterLocalNotificationsPlugin());
  await localNotificationService.init();
  localNotificationService.showNotificationAndroid("topic", "message");*/
  await BackgroundService.init();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.noTransition,
        theme: ThemeData(primarySwatch: mainColor, scaffoldBackgroundColor: Colors.grey.shade200, appBarTheme: const AppBarTheme(backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 1)),
        home: const RoomsPage(),
        initialBinding: BindingsBuilder(() {
          Get.put(RepositoryImpl(SerceApi(prefs: prefs), prefs));
          Get.put(RoomsController());
          Get.put(RoomController());
        }));
  }
}
