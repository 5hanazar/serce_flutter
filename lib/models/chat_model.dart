import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class DTO {
  static final types.User user1 =
      types.User(id: 'user1', firstName: 'John', lastName: 'Sins');
  static final types.User user2 =
      types.User(id: 'user2', firstName: 'Billy', lastName: 'Herrington');
  static final types.User user3 =
      types.User(id: 'user3', firstName: 'Sammy', lastName: 'Amanov');
  static final List<types.User> users1 = [
  types.User(id: 'user1', firstName: 'Alice'),
  types.User(id: 'user2', firstName: 'Bob'),
];
  static final List<types.Room> rooms = [
    types.Room(id: 'room1', users: [user1, user2], type: types.RoomType.direct, name: 'Billy'),
    types.Room(id: 'room2', users: [user1, user2, user3], type: types.RoomType.group, name: 'Group'),
    // types.Room(id: 'room2', users: [user1, user2, user3], type: types.RoomType.group),
    // types.Room(id: 'room2', users: [user1, user2, user3], type: types.RoomType.channel)
  ];
  static final List<types.Message> chatHistoryRoom = [
  types.TextMessage(
  
    author: user1,  
    id: '1',
    text: 'Привет, как дела?',
    createdAt: DateTime.now().subtract(Duration(minutes: 10)).millisecondsSinceEpoch,
    roomId: 'room1'
  ),
  types.TextMessage(
    author: user2,
    id: '2',
    text: 'Все хорошо, а ты?',
    createdAt: DateTime.now().subtract(Duration(minutes: 9)).millisecondsSinceEpoch,
    roomId: 'room1'
  ),
  types.TextMessage(
    author: user1,
    id: '3',
    text: 'Всем привет!',
    createdAt: DateTime.now().subtract(Duration(hours: 1)).millisecondsSinceEpoch,
    roomId: 'room2'
  ),
  types.TextMessage(
    author: user2,
    id: '4',
    text: 'Привет!',
    createdAt: DateTime.now().subtract(Duration(minutes: 59)).millisecondsSinceEpoch,
    roomId: 'room2'
  ),
  types.TextMessage(
    author: user3,
    id: '5',
    text: 'Как у вас дела?',
    createdAt: DateTime.now().subtract(Duration(minutes: 58)).millisecondsSinceEpoch,
    roomId: 'room2'
  ),
];
  // static final List<types.Message> messages = [
  //   types.TextMessage(
  //       id: 'msg1',
  //       author: user1,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       text: 'Hello'),
  //   types.TextMessage(
  //       id: 'msg2',
  //       author: user2,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       text: 'Hi'),
  //   types.TextMessage(
  //       id: 'msg3',
  //       author: user1,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       text: 'How are you'),
  //   types.TextMessage(
  //       id: 'msg4',
  //       author: user2,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       text: 'Fine')
  // ];
}
