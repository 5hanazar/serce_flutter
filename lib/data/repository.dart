import 'package:serce/data/data_sources/api_serce.dart';
import 'package:serce/domain/repository.dart';
import 'package:serce/resources/data_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryImpl implements Repository {
  final SerceApi _api;
  final SharedPreferences prefs;

  RepositoryImpl(this._api, this.prefs);

  @override
  Future<MessagesDto> getMessages(int roomId) async {
    final result = await _api.getMessages(roomId);
    return result;
  }

  @override
  Future<RoomsDto> getRooms() async {
    final result = await _api.getRooms();
    return result;
  }

  @override
  Future<MyState<int>> postMessage(int roomId, PostMessageDto dto) async {
    try {
      final result = await _api.postMessage(roomId, dto);
      return MyState.success(result);
    } on Exception catch (error, _) {
      return MyState.error(null, error.toString());
    }
  }

  @override
  Future<MyState<int>> postLogin(PostLoginDto dto) async {
    try {
      final result = await _api.postLogin(dto);
      return MyState.success(result);
    } on Exception catch (error, _) {
      return MyState.error(null, error.toString());
    }
  }
}