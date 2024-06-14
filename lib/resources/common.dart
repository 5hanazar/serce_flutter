import 'package:flutter/material.dart';

//const String baseURL = "https://altynmarket.com.tm";
const String baseURL = "http://10.0.2.2:5173";
const myDuration = Duration(milliseconds: 200);
const mainColor = Colors.purple;

class ClientDtoView {
  int id;
  bool active;
  String name;
  String phone;
  String description;
  String address;

  ClientDtoView({required this.id, required this.active, required this.name, required this.phone, required this.description, required this.address});

  factory ClientDtoView.fromJson(Map<String, dynamic> json) {
    return ClientDtoView(id: json['id'], active: json['active'], name: json['name'], phone: json['phone'], description: json['description'], address: json['address']);
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

    return RoomDtoView(id: json['id'], adminClient: client, clients: json['clients'], messages: messages, createdDate: json['createdDate']);
  }
}

class MessageDtoView {
  int id;
  String description;
  ClientDtoView client;
  String createdDate;

  MessageDtoView({required this.id, required this.description, required this.client, required this.createdDate});

  factory MessageDtoView.fromJson(Map<String, dynamic> json) {
    var client = ClientDtoView.fromJson(json['client']);
    return MessageDtoView(id: json['id'], description: json['description'], client: client, createdDate: json['createdDate']);
  }
}