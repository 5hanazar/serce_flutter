import 'package:flutter/material.dart';
import 'package:get/get.dart';


// class HomeScreen2 extends StatelessWidget {
//   final MySearchController1 searchController = Get.put(MySearchController1());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Obx(() => searchController.isSearching.value
//             ? searchController.buildSearchTextField(context)
//             : Text('AppBar Title')),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               searchController.toggleSearch();
//             },
//           ),
//         ],
//       ),
//       body: Center(child: Text('Main Content')),
//     );
//   }
// }

// class MySearchController1 extends GetxController {
//   var isSearching = false.obs;
//   final TextEditingController searchController = TextEditingController();

//   Widget buildSearchTextField(BuildContext context) {
//     return Expanded(
//       child: TextField(
//         controller: searchController,
//         autofocus: true,
//         decoration: InputDecoration(
//           prefixIcon: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: toggleSearch,
//           ),
//           hintText: "Search...",
//           border: InputBorder.none,
//         ),
//         onChanged: (value) {
//           print("Searching: $value");
//         },
//       ),
//     );
//   }

//   void toggleSearch() {
//     // Сброс фокуса для проверки последовательности
//     if (isSearching.value) {
//       FocusManager.instance.primaryFocus?.unfocus(); // Сброс фокуса
//       print("Фокус снят");
//       searchController.clear();
//     }
    
//     // Меняем состояние после фокуса
//     isSearching.value = !isSearching.value;
//     print("isSearching: ${isSearching.value}");
//   }
// }
