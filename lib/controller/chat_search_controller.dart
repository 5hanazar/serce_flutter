import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serce/constants/colors.dart';

// class MySearchController extends GetxController {
//   var isSearching = false.obs; // Статус поля поиска
//   final TextEditingController searchController = TextEditingController();
//   Widget buildSearchTextField(BuildContext context) {
//     final TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium;
//     return Expanded(
//       child: TextField(
      
//         style: displayMedium,
//         controller: searchController,
//         autofocus: true,
//         decoration: InputDecoration(
        
//           iconColor: mySearchInputIcon,
//           prefixIconColor: mySearchInputIcon,
//           prefixIcon: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: toggleSearch,
//           ),
//           hintText: "Search...",
//           hintStyle: displayMedium,
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.only(top: 13)
//         ),
//         onChanged: (value) {
//           // Логика поиска
//           print("Searching: $value");
//         },
//       ),
//     );
//   }

//   // Метод для переключения режима поиска
//   void toggleSearch() {
//     if (isSearching.value) {
//       FocusScope.of(Get.context!).unfocus();// Очистка поля при отмене поиска
//       searchController.clear();
//     }
//     isSearching.value = !isSearching.value;
//     print(isSearching.value);
//   }
// }
