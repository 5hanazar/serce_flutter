import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../controller/input_controller.dart';

// class MyCustomInput extends StatelessWidget {
//   MyCustomInput({super.key, required this.onSend});
//   final onSend;
//   final MyCustomInputController inputC = Get.put(MyCustomInputController());
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       color: Colors.grey[200],
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               onChanged: (text) {
//                 inputC.messageText.value = text;
//               },
//               decoration: InputDecoration(
//                 hintText: 'Введите сообщение...',
//                 border: InputBorder.none,
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               ),
//               onSubmitted: (_) =>
//                   inputC.sendMessage, // Отправка по нажатию Enter
//             ),
//           ),
//           Obx(
//             () => inputC.messageText.isNotEmpty
//                 ? IconButton(
//                     icon: Icon(Icons.send, color: mysecondary),
//                     onPressed: inputC.sendMessage,
//                   )
//                 : SizedBox.shrink(),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MyCustomInput extends StatelessWidget {
  // final void Function(types.PartialText message) onSend;
  final MyCustomInputController inputC = Get.put(MyCustomInputController());

  MyCustomInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: double.infinity,
        child: TextField(
        onSubmitted: (_) => inputC.handleSend(),
          controller: inputC.textController.value,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(Icons.emoji_emotions),
              onPressed: () {},
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
              inputC.handleSend();
              },
            ),
            border: InputBorder.none,
            hintText: 'Message',
            contentPadding: EdgeInsets.only(left: 5, right: 10, top: 5),
          ),
          
        )
        );
  }
}
