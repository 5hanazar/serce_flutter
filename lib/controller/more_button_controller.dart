import 'package:get/get.dart';

class MyMoreContextMenuController extends GetxController {
  var currentMenu = 'main'.obs;
  var isMenuVisible = false.obs;

  void closeMenu() {
    isMenuVisible.value = false;
  }

  void switchMenu(String menu) {
    currentMenu.value = menu;
  }

  void resetMenu() {
    currentMenu.value = 'main';
  }
  
}