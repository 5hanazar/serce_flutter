import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class MyMoreContextMenuController extends GetxController {
  var currentMenu = 'main'.obs;
  var isMenuVisible = false.obs;
  var isSearching = false.obs;

  void closeMenu() {
    isMenuVisible.value = false;
  }

  void switchMenu(String menu) {
    currentMenu.value = menu;
  }

  void resetMenu() {
    currentMenu.value = 'main';
  }

  final moreContextSearchController = TextEditingController();
  Widget buildSearchTextField(BuildContext context) {
    final TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium;
    return Expanded(
      child: TextField(
        style: displayMedium,
        controller: moreContextSearchController,
        autofocus: true,
        decoration: InputDecoration(
            iconColor: mySearchInputIcon,
            prefixIconColor: mySearchInputIcon,
            prefixIcon: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: toggleSearch,
            ),
            hintText: "Search...",
            hintStyle: displayMedium,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 13)),
        onChanged: (value) {
          // Логика поиска
          print("Searching: $value");
        },
      ),
    );
  }

  void toggleSearch() {
    // Сброс фокуса для проверки последовательности
    if (isSearching.value) {
      FocusManager.instance.primaryFocus?.unfocus(); // Сброс фокуса
      print("Фокус снят");
      moreContextSearchController.clear();
    }

    // Меняем состояние после фокуса
    isSearching.value = !isSearching.value;
    print("isSearching: ${isSearching.value}");
  }
}
