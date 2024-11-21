import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTabBarController extends GetxController {
  final tabs = <Widget>[
    Tab(
      text: 'All chats',
    ),
    Tab(
      text: 'All channels',
    ),
    Tab(
      text: 'Private chats',
    ),
  ].obs;
  final tabBarView = <Widget>[
    Center(
      child: Text('First widget'),
    ),
    Center(
      child: Text('second widget'),
    ),
    Center(
      child: Text('third widget'),
    ),
  ].obs;
  
  
}
