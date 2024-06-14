import 'dart:convert';
import 'package:serce/domain/repository.dart';
import 'package:serce/resources/common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SerceApi {
  final SharedPreferences prefs;

  const SerceApi({required this.prefs});

  Future<T> _fetch<T>(String url, final T Function(Map<String, dynamic> json) converter) async {
    final response = await http.get(Uri.parse(baseURL + url), headers: {
      "Accept": "application/json",
      "Cookie": prefs.getString("serce_user") ?? ""
    }).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      //if (response.headers["set-cookie"] != null) await prefs.setString('serce_user', response.headers["set-cookie"].toString());
      //print(response.body.toString());
      //print("Success ${response.headers["set-cookie"]} ${T.toString()}");
      return converter(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  Future<RoomsDto> getRooms() {
    return _fetch<RoomsDto>('/rooms', RoomsDto.fromJson);
  }

  Future<MessagesDto> getMessages(int roomId) {
    return _fetch<MessagesDto>('/rooms/$roomId', MessagesDto.fromJson);
  }

  Future<ProfileDto> getProfile() {
    return _fetch<ProfileDto>('/profile', ProfileDto.fromJson);
  }

  Future<int> postMessage(int roomId, PostMessageDto dto) async {
    final request = http.MultipartRequest('POST', Uri.parse('$baseURL/rooms/$roomId'));
    request.headers["Accept"] = "application/json";
    request.headers["Cookie"] = prefs.getString("serce_user") ?? "";
    request.fields['data'] = jsonEncode(dto);
    final response = await request.send();
    if (response.statusCode == 200) return 0;
    throw Exception('${response.statusCode}');
  }

  Future<int> postLogin(PostLoginDto dto) async {
    final response = await http.post(Uri.parse('$baseURL/login'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(dto)
    );
    if (response.statusCode == 200) {
      if (response.headers["set-cookie"] != null) await prefs.setString('serce_user', response.headers["set-cookie"].toString());
      return 0;
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
