import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:serce/constants/colors.dart';
import 'package:serce/widgets/chat_widgets/attachments_options.dart';

import '../../../controller/input_controller.dart';

class MyCustomInput extends StatelessWidget {
  final MyCustomInputController inputC = Get.put(MyCustomInputController());

  MyCustomInput({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mySearchAppbarPrimary,
      height: 50,
      width: double.infinity,
      child: TextField(
        onSubmitted: (_) => inputC.handleSend(),
        controller: inputC.textController.value,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(Icons.emoji_emotions, color: myIcons),
            onPressed: () {},
          ),
          // Смена кнопки в зависимости от наличия текста
          suffixIcon: Obx(() => inputC.isSendButtonVisible.value
              ? IconButton(
                  icon: Icon(Icons.send, color: myIcons),
                  onPressed: inputC.handleSend,
                )
              : IconButton(
                  icon: Icon(Icons.attach_file, color: myIcons),
                  onPressed: inputC.handleImageSelection,
                )),
          border: InputBorder.none,
          hintText: 'Message',
          hintStyle: TextStyle(height: 3, color: mySubTitlePrimary),
          contentPadding: EdgeInsets.only(left: 5, right: 10, top: 5),
        ),
      ),
    );
  }
}


