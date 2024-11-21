import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serce/constants/colors.dart';
import 'package:serce/widgets/chat_widgets/chat_more_context_menu_items.dart';

import '../../controller/chat_search_controller.dart';
import '../../controller/more_button_controller.dart';

// Контекст меню не закрывается поэтому и нужно двойное нажатие чтобы закрыть поле ввода
class MyMoreContextMenu extends StatelessWidget {
  final MyMoreContextMenuController menuController =
      Get.put(MyMoreContextMenuController());
  // final MySearchController searchController = Get.put(MySearchController());
  final LayerLink _layerLink = LayerLink();

  MyMoreContextMenu({super.key});

  void _showMenu(BuildContext context) {
    final overlay = Overlay.of(context);
    OverlayEntry? overlayEntry;
    final TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    final TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;

    final TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall;
    final TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            overlayEntry?.remove(); // Закрытие меню при нажатии на любое место
            menuController.closeMenu();
          },
          child: Stack(
            children: [
              Positioned(
                width: 250,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(-200, 0), // Позиция меню
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 3.0,
                      child: Obx(() {
                        // Отображаем меню в зависимости от текущего состояния
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: menuController.currentMenu.value == 'main'
                              ? [
                                  ListTile(
                                    title: Text(
                                      'Notification',
                                      style: titleMedium,
                                    ),
                                    leading: Icon(Icons.volume_up),
                                    trailing: Transform.translate(
                                        offset: Offset(15, 0),
                                        child: Icon(Icons.chevron_right)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    onTap: () {
                                      menuController
                                          .switchMenu('notifications');
                                    },
                                  ),
                                  Container(
                                    height: 8,
                                    width: double.infinity,
                                    color: myMoreContextMenuContainer,
                                  ),
                                  ChatMoreContextMenuItems(
                                    title: 'Vide call',
                                    leading: Icons.video_call,
                                    style: titleMedium,
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.search),
                                    title: Text(
                                      'Search',
                                      style: titleMedium,
                                    ),
                                    onTap: () {
                                      // Действие для уведомления 1
                                      menuController.toggleSearch();
                                      overlayEntry?.remove();
                                      menuController.closeMenu();
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.wallpaper),
                                    title: Text(
                                      'Change background',
                                      style: titleMedium,
                                    ),
                                    onTap: () {
                                      // Действие для уведомления 1
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.cleaning_services),
                                    title: Text(
                                      'Clear history',
                                      style: titleMedium,
                                    ),
                                    onTap: () {
                                      // Действие для уведомления 1
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text(
                                      'Delete chat',
                                      style: titleMedium,
                                    ),
                                    onTap: () {
                                      // Действие для уведомления 1
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                  ),
                                ]
                              : menuController.currentMenu.value ==
                                      'notifications'
                                  ? [
                                      ListTile(
                                        leading: Icon(Icons.arrow_back_sharp),
                                        title: Text(
                                          'Back',
                                          style: titleMedium,
                                        ),
                                        onTap: () {
                                          menuController.switchMenu('main');
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        )),
                                      ),
                                      ListTile(
                                        leading:
                                            Icon(Icons.media_bluetooth_off),
                                        title: Text(
                                          'Turn off sound',
                                          style: titleMedium,
                                        ),
                                        onTap: () {
                                          // Действие для уведомления 1
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.ring_volume),
                                        title: Text(
                                          'Turn for a time',
                                          style: titleMedium,
                                        ),
                                        onTap: () {
                                          // Действие для уведомления 2
                                        },
                                      ),
                                      ListTile(
                                        leading:
                                            Icon(Icons.dashboard_customize),
                                        title: Text(
                                          'Customize',
                                          style: titleMedium,
                                        ),
                                        onTap: () {
                                          // Действие для уведомления 1
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.volume_mute),
                                        title: Text(
                                          'Turn off notifications',
                                          style: titleMedium,
                                        ),
                                        onTap: () {
                                          // Действие для уведомления 1
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        )),
                                      ),
                                    ]
                                  : [],
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    overlay.insert(overlayEntry);
    menuController.isMenuVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {
          menuController.resetMenu();
          _showMenu(context);
        },
      ),
    );
  }
}
