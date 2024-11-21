import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMenuController extends GetxController {

  var selectedIndex = 0.obs;
  final List<Widget> widgetOptions = [
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ].obs;
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}


