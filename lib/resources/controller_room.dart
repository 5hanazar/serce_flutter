import 'package:get/get.dart';
import 'package:serce/data/repository.dart';
import 'package:serce/domain/repository.dart';
import 'package:serce/presentation/pages/page_login.dart';
import 'package:serce/resources/background_service.dart';
import 'package:serce/resources/data_state.dart';

class RoomController extends GetxController {
  final RepositoryImpl _repo = Get.find();
  MyState<MessagesDto> dataState = MyState.loading(null);

  Future<void> refreshRoom(int roomId) async {
    dataState = MyState.loading(dataState.value);
    update();
    try {
      final result = await _repo.getMessages(roomId);
      dataState = MyState.success(result);
      update();
    } on Exception catch (error, _) {
      if (error.toString().endsWith("405")) {
        BackgroundService.stop();
        Get.offAll(() => const LoginPage());
        return;
      }
      dataState = MyState.error(dataState.value, error.toString());
      update();
    }
  }

  void send(int roomId, String description) async {
    final r = await _repo.postMessage(roomId, PostMessageDto(description: description));
    if (r is MySuccessState) refreshRoom(roomId);
  }

  void clear()  {
    dataState = MyState.loading(null);
  }
}