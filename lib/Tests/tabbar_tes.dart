import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabController extends GetxController {
  var tabs = <Tab>[
    Tab(
      text: 'df',
    ),
    Tab(
      text: 'df',
    ),
  ].obs;
  var tabViews = <Widget>[Center(child: Text('first'),),Center(child: Text('second'),)].obs;

  void addTab(String label, Widget content) {
    tabs.add(Tab(text: label));
    tabViews.add(content);
  }

  void removeTab(int index) {
    tabs.removeAt(index);
    tabViews.removeAt(index);
  }
}

class TabbarTes extends StatelessWidget {
  TabbarTes({super.key});
  final MyTabController tabController = Get.put(MyTabController());
  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabController.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom:  TabBar(tabs: tabController.tabs),
        ),
        body: TabBarView(children: tabController.tabViews.value),
      ),
    );
  }
}
