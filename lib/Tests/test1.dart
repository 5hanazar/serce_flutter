import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serce/Tests/custom_list_tile.dart';
import 'package:serce/constants/colors.dart';
import 'package:open_filex/open_filex.dart';
// class MyMenuController extends GetxController {
//   var currentMenu = 'main'.obs;
//   var isMenuVisible = false.obs;

//   void closeMenu() {
//     isMenuVisible.value = false;

//   }

//   void switchMenu(String menu) {
//     currentMenu.value = menu;
//   }

//   void resetMenu() {
//     currentMenu.value = 'main';
//   }
// }

// class MyContextMenu extends StatelessWidget {
//   final MyMenuController menuController = Get.put(MyMenuController());
//   final LayerLink _layerLink = LayerLink();

//   void _showMenu(BuildContext context) {
//     final overlay = Overlay.of(context);
//     OverlayEntry? overlayEntry;

//     overlayEntry = OverlayEntry(
//       builder: (context) {
//         return Positioned(
//           width: 200,
//           child: CompositedTransformFollower(
//             link: _layerLink,
//             showWhenUnlinked: false,
//             offset: Offset(-150, 0), // Позиция меню
//             child: Material(
//               elevation: 8.0,
//               child: Obx(() {
//                 // Отображаем меню в зависимости от текущего состояния
//                 return Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: menuController.currentMenu.value == 'main'
//                       ? [
//                           ListTile(
//                             title: Text('Notifications'),
//                             onTap: () {
//                               menuController.switchMenu('notifications');
//                             },
//                           ),
//                           ListTile(
//                             title: Text('Settings'),
//                             onTap: () {
//                               menuController.switchMenu('settings');
//                             },
//                           ),
//                         ]
//                       : menuController.currentMenu.value == 'notifications'
//                           ? [
//                               ListTile(
//                                 title: Text('Back to Main Menu'),
//                                 onTap: () {
//                                   menuController.switchMenu('main');
//                                 },
//                               ),
//                               ListTile(
//                                 title: Text('Notification 1'),
//                                 onTap: () {
//                                   // Действие для уведомления 1
//                                 },
//                               ),
//                               ListTile(
//                                 title: Text('Notification 2'),
//                                 onTap: () {
//                                   // Действие для уведомления 2
//                                 },
//                               ),
//                             ]
//                           : [
//                               ListTile(
//                                 title: Text('Back to Main Menu'),
//                                 onTap: () {
//                                   menuController.switchMenu('main');
//                                 },
//                               ),
//                               ListTile(
//                                 title: Text('Setting 1'),
//                                 onTap: () {
//                                   // Действие для настройки 1
//                                 },
//                               ),
//                               ListTile(
//                                 title: Text('Setting 2'),
//                                 onTap: () {
//                                   // Действие для настройки 2
//                                 },
//                               ),
//                             ],
//                 );
//               }),
//             ),
//           ),
//         );
//       },
//     );

//     overlay.insert(overlayEntry);

//     // Скрытие меню при клике вне его
//     // Future.delayed(Duration.zero, () {
//     //   GestureDetector(
//     //     behavior: HitTestBehavior.translucent,
//     //     onTap: () {
//     //       overlayEntry?.remove();
//     //       menuController.resetMenu();
//     //     },
//     //   );
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('tap');
//         if (menuController.isMenuVisible.value) {
//           menuController.closeMenu();
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Dynamic Menu Example'),
//           actions: [
//             CompositedTransformTarget(
//               link: _layerLink,
//               child: IconButton(
//                 icon: Icon(Icons.more_vert),
//                 onPressed: () {
//                   menuController.isMenuVisible.value = true;
//                   menuController.resetMenu();
//                   _showMenu(context);
//                 },
//               ),
//             ),
//           ],
//         ),
//         body: Center(
//           child: Text('Main Screen'),
//         ),
//       ),
//     );
//   }
// }

class MyImagePickerController extends GetxController {
  final selectedImagePath = ''.obs;
  final selectedImageSize = ''.obs;

  void selectImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          '${(File(selectedImagePath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb';
    } else {
      selectedImagePath.value='';
    }
  }
}

class MyImagePicker extends StatelessWidget {
  MyImagePicker({super.key});
  final MyImagePickerController imagePickerController =
      Get.put(MyImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: Column(
          children: [
            Obx(() => imagePickerController.selectedImagePath.value == ''
                ? Text('Please select image', style: TextStyle(color: Colors.black),)
                : Image.file(File(imagePickerController.selectedImagePath.value))),
            TextButton(
              onPressed: () {
                imagePickerController.selectImage(ImageSource.camera);
              },
              child: Text(
                'Camera',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                imagePickerController.selectImage(ImageSource.gallery);
              },
              child: Text(
                'Gallery',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
