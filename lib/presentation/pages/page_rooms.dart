import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serce/domain/repository.dart';
import 'package:serce/presentation/pages/page_add_contact.dart';
import 'package:serce/presentation/pages/page_room.dart';
import 'package:serce/resources/background_service.dart';
import 'package:serce/resources/controller_rooms.dart';
import 'package:serce/resources/data_state.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  final RoomsController controller = Get.find();

  @override
  void initState() {
    super.initState();
    BackgroundService.reLaunch();
    controller.refreshRooms();
    BackgroundService.listenUI((event) {
      controller.refreshRooms();
    });
    print("MyLOG _RoomsPageState initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Serçe"),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 0, bottom: 6),
            child: Image.asset('assets/ic_launcher.png'),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add
              ),
              onPressed: () async {
                final r = await Get.to(() => const AddContactPage(), preventDuplicates: false);
                if (r == 1) controller.refreshRooms();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: GetBuilder<RoomsController>(builder: (controller) {
          //if (controller.dataState.value == null) return Center(child: IconButton(onPressed: _doRefresh, icon: const Icon(Icons.refresh)));
          if (controller.dataState is MyErrorState) {
            var m = controller.dataState as MyErrorState;
            return Column(children: [
              Container(height: 32, alignment: Alignment.center, color: const Color(0xffFFCDD2), width: double.maxFinite, child: Text(m.msg, maxLines: 1, style: const TextStyle(color: Colors.red))),
              RoomsList(dataState: controller.dataState)
            ]);
          }
          return RoomsList(dataState: controller.dataState);
        }));
  }
}

class RoomsList extends StatelessWidget {
  final MyState<RoomsDto> dataState;

  const RoomsList({super.key, required this.dataState});

  @override
  Widget build(BuildContext context) {
    if (dataState.value == null) return const Text("");
    final data = dataState.value!;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
      itemCount: data.result.length,
      itemBuilder: (BuildContext context, int index) {
        final roomTitle = data.result[index].clients.firstWhereOrNull((el) => el.id != data.user.id)?.name ?? "";
        return GestureDetector(
          onTap: () {
            Get.to(() => RoomPage(roomId: data.result[index].id, roomTitle: roomTitle), preventDuplicates: false);
          },
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Row(
              children: <Widget>[
                const CircleAvatar(
                  maxRadius: 30,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(roomTitle, style: const TextStyle(fontSize: 16)),
                      Text(data.result[index].lastMessage ?? "", style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
