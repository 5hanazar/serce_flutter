import 'package:serce/resources/data_state.dart';

abstract class Repository {
  Future<RoomsDto> getRooms();
  Future<MessagesDto> getMessages(int roomId);
  Future<MyState<int>> postMessage(int roomId, PostMessageDto dto);
  Future<MyState<int>> postLogin(PostLoginDto dto);
}

class RoomsDto {
  ClientDtoView user;
  List<RoomDtoView> result;
  RoomsDto({required this.user, required this.result});
  factory RoomsDto.fromJson(Map<String, dynamic> json) {
    var result = <RoomDtoView>[];
    json['result'].forEach((v) {
      result.add(RoomDtoView.fromJson(v));
    });
    return RoomsDto(user: ClientDtoView.fromJson(json['user']), result: result);
  }
}

class MessagesDto {
  RoomDtoView result;
  MessagesDto({required this.result});
  factory MessagesDto.fromJson(Map<String, dynamic> json) {
    var result = RoomDtoView.fromJson(json['result']);
    return MessagesDto(result: result);
  }
}

class ProfileDto {
  ClientDtoView result;
  ProfileDto({required this.result});
  factory ProfileDto.fromJson(Map<String, dynamic> json) {
    var result = ClientDtoView.fromJson(json['result']);
    return ProfileDto(result: result);
  }
}

class ClientDtoView {
  int id;
  String name;
  String phone;
  String description;
  String address;

  ClientDtoView({required this.id, required this.name, required this.phone, required this.description, required this.address});

  factory ClientDtoView.fromJson(Map<String, dynamic> json) {
    return ClientDtoView(id: json['id'], name: json['name'], phone: json['phone'], description: json['description'], address: json['address']);
  }
}

class RoomDtoView {
  int id;
  ClientDtoView? adminClient;
  List<ClientDtoView> clients;
  List<MessageDtoView> messages;
  String createdDate;

  RoomDtoView({required this.id, required this.adminClient, required this.clients, required this.messages, required this.createdDate});

  factory RoomDtoView.fromJson(Map<String, dynamic> json) {
    ClientDtoView? client;
    if (json['adminClient'] != null) {
      client = ClientDtoView.fromJson(json['client']);
    }

    var messages = <MessageDtoView>[];
    if (json['messages'] != null) {
      json['messages'].forEach((v) {
        messages.add(MessageDtoView.fromJson(v));
      });
    }

    var clients = <ClientDtoView>[];
    if (json['clients'] != null) {
      json['clients'].forEach((v) {
        clients.add(ClientDtoView.fromJson(v));
      });
    }

    return RoomDtoView(id: json['id'], adminClient: client, clients: clients, messages: messages, createdDate: json['createdDate']);
  }
}

class MessageDtoView {
  int id;
  String description;
  ClientDtoView client;
  bool isMine;
  String createdDate;

  MessageDtoView({required this.id, required this.description, required this.client, required this.isMine, required this.createdDate});

  factory MessageDtoView.fromJson(Map<String, dynamic> json) {
    var client = ClientDtoView.fromJson(json['client']);
    return MessageDtoView(id: json['id'], description: json['description'], client: client, isMine: json['isMine'], createdDate: json['createdDate']);
  }
}

class PostMessageDto {
  String description;
  PostMessageDto({required this.description});
  Map<String, dynamic> toJson() => {'description': description};
}

class PostLoginDto {
  String name;
  String phone;
  PostLoginDto({required this.name, required this.phone});
  Map<String, dynamic> toJson() => {'name': name, 'phone': phone};
}