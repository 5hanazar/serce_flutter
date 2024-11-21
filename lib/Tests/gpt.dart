import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FMenuController extends GetxController {
  // Статус меню, по умолчанию - главное меню
  var currentMenu = 'main'.obs;
  var isMenuOpen = false.obs;

  // Переключение между основным и подменю
  void switchMenu(String menu) {
    currentMenu.value = menu;
  }

  // Закрытие меню и возврат к главному
  void closeMenu() {
    currentMenu.value = 'main';
    isMenuOpen.value = false;
  }

  // Открытие меню
  void openMenu() {
    isMenuOpen.value = true;
  }
}

class HomeScreen1 extends StatelessWidget {
  final FMenuController menuController = Get.put(FMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Top Right Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              if (menuController.isMenuOpen.value) {
                menuController.closeMenu();
              } else {
                menuController.openMenu();
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(child: Text('Main Screen')),
          Obx(() {
            // Проверяем статус меню для отображения
            if (!menuController.isMenuOpen.value) return SizedBox.shrink();

            return Positioned(
              right: 16,
              top: 56,
              child: Material(
                elevation: 8,
                child: Container(
                  width: 200,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: menuController.currentMenu.value == 'main'
                        ? [
                            ListTile(
                              title: Text('Notifications'),
                              onTap: () {
                                menuController.switchMenu('notifications');
                              },
                            ),
                            ListTile(
                              title: Text('Settings'),
                              onTap: () {
                                menuController.switchMenu('settings');
                              },
                            ),
                          ]
                        : menuController.currentMenu.value == 'notifications'
                            ? [
                                ListTile(
                                  title: Text('Back to Main Menu'),
                                  onTap: () {
                                    menuController.switchMenu('main');
                                  },
                                ),
                                ListTile(
                                  title: Text('Notification 1'),
                                  onTap: () {
                                    // Действие для уведомления 1
                                  },
                                ),
                                ListTile(
                                  title: Text('Notification 2'),
                                  onTap: () {
                                    // Действие для уведомления 2
                                  },
                                ),
                              ]
                            : [
                                ListTile(
                                  title: Text('Back to Main Menu'),
                                  onTap: () {
                                    menuController.switchMenu('main');
                                  },
                                ),
                                ListTile(
                                  title: Text('Setting 1'),
                                  onTap: () {
                                    // Действие для настройки 1
                                  },
                                ),
                                ListTile(
                                  title: Text('Setting 2'),
                                  onTap: () {
                                    // Действие для настройки 2
                                  },
                                ),
                              ],
                  ),
                ),
              ),
            );
          }),
          // Добавляем GestureDetector для закрытия меню при касании вне его
          Obx(() {
            if (!menuController.isMenuOpen.value) return SizedBox.shrink();
            return Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  menuController.closeMenu();
                },
                behavior: HitTestBehavior.translucent,
              ),
            );
          }),
        ],
      ),
    );
  }
}
