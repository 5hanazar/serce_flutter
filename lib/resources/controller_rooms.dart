import 'package:get/get.dart';
import 'package:serce/data/repository.dart';
import 'package:serce/domain/repository.dart';
import 'package:serce/presentation/pages/page_login.dart';
import 'package:serce/resources/background_service.dart';
import 'package:serce/resources/data_state.dart';

class RoomsController extends GetxController {
  final RepositoryImpl _repo = Get.find();
  MyState<RoomsDto> dataState = MyState.loading(null);

  Future<void> refreshRooms() async {
    dataState = MyState.loading(dataState.value);
    update();
    try {
      final result = await _repo.getRooms();
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
}