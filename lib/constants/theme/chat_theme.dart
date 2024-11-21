import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../colors.dart';

// class MyCustomChatTheme extends ChatTheme{
//   MyCustomChatTheme({key, required super.attachmentButtonIcon, required super.attachmentButtonMargin, required super.backgroundColor, required super.dateDividerMargin, required super.dateDividerTextStyle, required super.deliveredIcon, required super.documentIcon, required super.emptyChatPlaceholderTextStyle, required super.errorColor, required super.errorIcon, required super.inputBackgroundColor, required super.inputSurfaceTintColor, required super.inputElevation, required super.inputBorderRadius, required super.inputMargin, required super.inputPadding, required super.inputTextColor, required super.inputTextDecoration, required super.inputTextStyle, required super.messageBorderRadius, required super.messageInsetsHorizontal, required super.messageInsetsVertical, required super.messageMaxWidth, required super.primaryColor, required super.receivedEmojiMessageTextStyle, required super.receivedMessageBodyTextStyle, required super.receivedMessageCaptionTextStyle, required super.receivedMessageDocumentIconColor, required super.receivedMessageLinkDescriptionTextStyle, required super.receivedMessageLinkTitleTextStyle, required super.secondaryColor, required super.seenIcon, required super.sendButtonIcon, required super.sendButtonMargin, required super.sendingIcon, required super.sentEmojiMessageTextStyle, required super.sentMessageBodyTextStyle, required super.sentMessageCaptionTextStyle, required super.sentMessageDocumentIconColor, required super.sentMessageLinkDescriptionTextStyle, required super.sentMessageLinkTitleTextStyle, required super.statusIconPadding, required super.systemMessageTheme, required super.typingIndicatorTheme, required super.unreadHeaderTheme, required super.userAvatarImageBackgroundColor, required super.userAvatarNameColors, required super.userAvatarTextStyle, required super.userNameTextStyle, })

// }

class MyCustomChatTheme extends ChatTheme {

  MyCustomChatTheme()
      : super(
      
          attachmentButtonIcon: Icon(Icons.attachment, color: Colors.grey),
          attachmentButtonMargin: EdgeInsets.all(8),
          backgroundColor: myBackground,
          dateDividerMargin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          dateDividerTextStyle: TextStyle(color: Colors.grey, fontSize: 12),
          deliveredIcon: Icon(Icons.done, color: Colors.green),
          documentIcon: Icon(Icons.insert_drive_file, color: Colors.blue),
          emptyChatPlaceholderTextStyle: TextStyle(color: myTextPrimary, fontSize: titleMediumFontSize),
          errorColor: Colors.red,
          errorIcon: Icon(Icons.error, color: Colors.red),
          inputBackgroundColor: Colors.white,
          inputSurfaceTintColor: Colors.grey[100]!,
          inputElevation: 2.0,
          inputBorderRadius: BorderRadius.circular(0),
          inputMargin: EdgeInsets.all(0),
          inputPadding: EdgeInsets.symmetric(horizontal: 20),
          inputTextColor: Colors.black,
          inputTextDecoration: InputDecoration(border: InputBorder.none),
          inputTextStyle: TextStyle(fontSize: 16, color: Colors.black),
          messageBorderRadius: 12,
          messageInsetsHorizontal: 8,
          messageInsetsVertical: 4,
          messageMaxWidth: 300,
          primaryColor: Colors.purple,
          receivedEmojiMessageTextStyle: TextStyle(fontSize: 30),
          receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
          receivedMessageCaptionTextStyle: TextStyle(color: Colors.grey),
          receivedMessageDocumentIconColor: Colors.blue,
          receivedMessageLinkDescriptionTextStyle:
              TextStyle(color: Colors.blue),
          receivedMessageLinkTitleTextStyle:
              TextStyle(fontWeight: FontWeight.bold),
          secondaryColor: Colors.grey[200]!,
          seenIcon: Icon(Icons.done_all, color: Colors.blue),
          sendButtonIcon: Icon(Icons.send, color: Colors.purple),
          sendButtonMargin: EdgeInsets.all(8),
          sendingIcon: Icon(Icons.access_time, color: Colors.grey),
          sentEmojiMessageTextStyle:
              TextStyle(fontSize: 30, color: Colors.white),
          sentMessageBodyTextStyle: TextStyle(color: Colors.white),
          sentMessageCaptionTextStyle: TextStyle(color: Colors.white70),
          sentMessageDocumentIconColor: Colors.white,
          sentMessageLinkDescriptionTextStyle: TextStyle(color: Colors.white70),
          sentMessageLinkTitleTextStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          statusIconPadding: EdgeInsets.all(4),
          systemMessageTheme: SystemMessageTheme(
          margin: EdgeInsets.all(5),
            textStyle: TextStyle(color: Colors.white),
          ),
          typingIndicatorTheme: TypingIndicatorTheme(
            multipleUserTextStyle: TextStyle(fontSize: 20),
            countTextColor: Colors.black,
            countAvatarColor: Colors.green,
            bubbleBorder: BorderRadius.circular(15),
          animatedCircleSize: 20,
            animatedCirclesColor: Colors.grey,
            bubbleColor: Colors.grey[400]!,
          ),
          unreadHeaderTheme: UnreadHeaderTheme(
            color: Colors.amber,
            textStyle: TextStyle(color: Colors.white),
          ),
          userAvatarImageBackgroundColor: Colors.grey[300]!,
          userAvatarNameColors: [Colors.orange, Colors.pink, Colors.purple],
          userAvatarTextStyle: TextStyle(color: Colors.white, fontSize: 12),
          userNameTextStyle: TextStyle(color: Colors.purple),
        );
}
