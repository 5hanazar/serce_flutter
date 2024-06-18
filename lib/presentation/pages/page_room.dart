import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serce/domain/repository.dart';
import 'package:serce/resources/background_service.dart';
import 'package:serce/resources/common.dart';
import 'package:serce/resources/controller_room.dart';
import 'package:serce/resources/data_state.dart';

class RoomPage extends StatefulWidget {
  final int roomId;
  final String roomTitle;

  const RoomPage({super.key, required this.roomId, required this.roomTitle});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final RoomController controller = Get.find();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.refreshRoom(widget.roomId);
    BackgroundService.listenUI((event) {
      controller.refreshRoom(widget.roomId);
    });
    print("MyLOG _RoomPageState initState");
  }

  @override
  void dispose() {
    super.dispose();
    controller.clear();
  }

  void _postMessage(String description) {
    controller.send(widget.roomId, description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.roomTitle), leading: const BackButton()),
        body: Column(children: [
          Expanded(
            child: GetBuilder<RoomController>(builder: (controller) {
              return MessagesList(scrollController: _scrollController, dataState: controller.dataState);
            }),
          ),
          MessageBar(
            messageBarHintText: "Ýaz birzatlar)",
            sendButtonColor: mainColor,
            onSend: (description) => {_postMessage(description)},
          )
        ]));
  }
}

class MessagesList extends StatelessWidget {
  final MyState<MessagesDto> dataState;
  final ScrollController scrollController;

  const MessagesList({super.key, required this.scrollController, required this.dataState});

  @override
  Widget build(BuildContext context) {
    if (dataState.value == null) return const Text("");
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    }); */
    return ListView.builder(
      reverse: true,
      controller: scrollController,
      itemCount: dataState.value!.result.messages.length,
      itemBuilder: (BuildContext context, int index) {
        return BubbleNormal(
          text: dataState.value!.result.messages[index].description,
          isSender: dataState.value!.result.messages[index].isMine,
          color: dataState.value!.result.messages[index].isMine ? mainColor : Colors.white,
          textStyle: TextStyle(
            fontSize: 20,
            color: dataState.value!.result.messages[index].isMine ? Colors.white : Colors.black,
          ),
        );
      },
    );
  }
}
