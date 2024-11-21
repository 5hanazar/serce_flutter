import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../../constants/colors.dart';
import 'package:flutter_chat_ui/src/widgets/state/inherited_chat_theme.dart';
import 'package:flutter_chat_ui/src/widgets/state/inherited_user.dart';
import 'package:flutter_chat_ui/src/conditional/conditional.dart';

import 'message_widgets/message_time_widget.dart';
// class MyCustomBubble extends StatelessWidget {
//   final types.Message message;
//   final Widget child;
//   final bool nextMessageInGroup;
//   final bool isSentByUser;
//   final DateTime? previousMessageDate;

//   MyCustomBubble({
//     Key? key,
//     required this.message,
//     required this.child,
//     required this.isSentByUser,
//     required this.nextMessageInGroup,
//     this.previousMessageDate,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     BorderRadius bubbleRadius = isSentByUser
//         ? BorderRadius.only(
//             topLeft: Radius.circular(14),
//             topRight:
//                 Radius.circular(isSentByUser || nextMessageInGroup ? 8 : 10),
//             bottomLeft: Radius.circular(14),
//             bottomRight:
//                 Radius.circular(isSentByUser && nextMessageInGroup ? 10 : 0))
//         : BorderRadius.only(
//             topLeft:
//                 Radius.circular(isSentByUser || nextMessageInGroup ? 8 : 10),
//             topRight: Radius.circular(14),
//             bottomLeft: Radius.circular(nextMessageInGroup ? 10 : 0),
//             bottomRight: Radius.circular(14));
//     return Container(
//       margin: EdgeInsets.only(bottom: nextMessageInGroup ? 0 : 10),
//       decoration: BoxDecoration(
//           color: isSentByUser ? mySecondary : myBubbleSecondary,
//           borderRadius: bubbleRadius),
//       padding: const EdgeInsets.all(8.0),
//       child: Stack(
//         children: [
//           // Основной контент сообщения
//           Container(margin: EdgeInsets.only(bottom: 10), child: child),
//           // Время сообщения
//           Positioned(
//               bottom: 0,
//               right: 0,
//               child: MessageTime(
//                 timestamp: DateTime.now(), // Время сообщения
//                 status: MessageStatus.sent, // Статус сообщения
//                 timeColor: Colors.grey[300]!,
//               )),
//         ],
//       ),
//     );

//   }
// }

// class MyCustomBubble extends StatelessWidget {
//   final types.Message message;
//   final Widget child;
//   final bool nextMessageInGroup;
//   final bool isSentByUser;
//   final DateTime? previousMessageDate;
//   final int maxLengthForInlineTime; // Максимальная длина текста для inline времени

//   MyCustomBubble({
//     Key? key,
//     required this.message,
//     required this.child,
//     required this.isSentByUser,
//     required this.nextMessageInGroup,
//     this.previousMessageDate,
//     this.maxLengthForInlineTime = 30,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Радиус углов бабла
//     BorderRadius bubbleRadius = isSentByUser
//         ? BorderRadius.only(
//             topLeft: Radius.circular(14),
//             topRight: Radius.circular(nextMessageInGroup ? 8 : 10),
//             bottomLeft: Radius.circular(14),
//             bottomRight: Radius.circular(nextMessageInGroup ? 10 : 0),
//           )
//         : BorderRadius.only(
//             topLeft: Radius.circular(nextMessageInGroup ? 8 : 10),
//             topRight: Radius.circular(14),
//             bottomLeft: Radius.circular(nextMessageInGroup ? 10 : 0),
//             bottomRight: Radius.circular(14),
//           );

//     // Проверка длины сообщения
//     final isShortMessage = message is types.TextMessage &&
//         (message as types.TextMessage).text.length <= maxLengthForInlineTime;
//     // print((message as types.TextMessage).text.length);
//     return Container(
//       margin: EdgeInsets.only(bottom: nextMessageInGroup ? 0 : 10),
//       decoration: BoxDecoration(
//         color: isSentByUser ? mySecondary : myBubbleSecondary,
//         borderRadius: bubbleRadius,
//       ),
//       padding: const EdgeInsets.all(3.0),
//       child: isShortMessage
//           ? Row(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Flexible(
//                   child: child, // Основное содержимое сообщения
//                 ),
//                 const SizedBox(width: 2),
//                 MessageTime(
//                   timestamp: DateTime.now(),
//                   status: MessageStatus.sent, // Пример: статус сообщения
//                   timeColor: Colors.grey[300]!,
//                 ),
//               ],
//             )
//           : Stack(
//               children: [
//                 // Основное содержимое сообщения
//                 Container(margin: EdgeInsets.only(bottom: 10), child: child),
//                 // Время сообщения
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: MessageTime(
//                     timestamp: DateTime.now(),
//                     status: MessageStatus.sent, // Пример: статус сообщения
//                     timeColor: Colors.grey[300]!,
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

// class MyTextMessageWidget extends StatelessWidget {
//   final types.TextMessage message;
//   const MyTextMessageWidget({Key? key, required this.message})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       message.text,
//       style: TextStyle(
//         color:
//             message.author.id == "current_user" ? Colors.white : Colors.black,
//         fontSize: 16,
//       ),
//     );
//   }
// }

Widget bubbleBuilder(Widget child,
    {required types.Message message,
    required bool nextMessageInGroup,
    required String currentUserId,
    int maxLengthForInlineTime = 30}) {
  // Проверяем тип сообщения
  final isSentByUser = message.author.id == currentUserId;
  BorderRadius bubbleRadius = isSentByUser
      ? BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(nextMessageInGroup ? 8 : 10),
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(nextMessageInGroup ? 10 : 0),
        )
      : BorderRadius.only(
          topLeft: Radius.circular(nextMessageInGroup ? 8 : 10),
          topRight: Radius.circular(14),
          bottomLeft: Radius.circular(nextMessageInGroup ? 10 : 0),
          bottomRight: Radius.circular(14),
        );
  final isShortMessage = message is types.TextMessage &&
          (message as types.TextMessage).text.length <=
              maxLengthForInlineTime ||
      message is types.ImageMessage;
  return Container(
    margin: EdgeInsets.only(bottom: nextMessageInGroup ? 0 : 10),
    decoration: BoxDecoration(
      color: isSentByUser ? mySecondary : Colors.grey.shade50, // Цвет фона
      borderRadius: bubbleRadius,
    ),
    padding: const EdgeInsets.all(3.0),

    child: isShortMessage
        ? Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: child, // Основное содержимое сообщения
              ),
              const SizedBox(width: 2),
              // MessageTime(
              //   status: LocalMessageStatus.sent,
              //   timestamp: DateTime.now(),
              // )
            ],
          )
        : Stack(
            children: [
              // Основное содержимое сообщения
              Container(margin: EdgeInsets.only(bottom: 10), child: child),
              // Время сообщения
              // Positioned(
              //     bottom: 0,
              //     right: 0,
              //     child: MessageTime(
              //       status: LocalMessageStatus.sent,
              //       timestamp: DateTime.now(),
              //     )),
            ],
          ),
  );
}

class ImageMessage extends StatefulWidget {
  /// Creates an image message widget based on [types.ImageMessage].
  const ImageMessage({
    super.key,
    this.imageHeaders,
    this.imageProviderBuilder,
    required this.message,
    required this.messageWidth,
  });

  /// See [Chat.imageHeaders].
  final Map<String, String>? imageHeaders;

  /// See [Chat.imageProviderBuilder].
  final ImageProvider Function({
    required String uri,
    required Map<String, String>? imageHeaders,
    required Conditional conditional,
  })? imageProviderBuilder;

  /// [types.ImageMessage].
  final types.ImageMessage message;

  /// Maximum message width.
  final int messageWidth;

  @override
  State<ImageMessage> createState() => _ImageMessageState();
}

/// [ImageMessage] widget state.
class _ImageMessageState extends State<ImageMessage> {
  ImageProvider? _image;
  Size _size = Size.zero;
  ImageStream? _stream;

  @override
  void initState() {
    super.initState();
    _image = widget.imageProviderBuilder != null
        ? widget.imageProviderBuilder!(
            uri: widget.message.uri,
            imageHeaders: widget.imageHeaders,
            conditional: Conditional(),
          )
        : Conditional().getProvider(
            widget.message.uri,
            headers: widget.imageHeaders,
          );
    _size = Size(widget.message.width ?? 0, widget.message.height ?? 0);
  }

  void _getImage() {
    final oldImageStream = _stream;
    _stream = _image?.resolve(createLocalImageConfiguration(context));
    if (_stream?.key == oldImageStream?.key) {
      return;
    }
    final listener = ImageStreamListener(_updateImage);
    oldImageStream?.removeListener(listener);
    _stream?.addListener(listener);
  }

  void _updateImage(ImageInfo info, bool _) {
    setState(() {
      _size = Size(
        info.image.width.toDouble(),
        info.image.height.toDouble(),
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_size.isEmpty) {
      _getImage();
    }
  }

  @override
  void dispose() {
    _stream?.removeListener(ImageStreamListener(_updateImage));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = InheritedUser.of(context).user;

    if (_size.aspectRatio == 0) {
      return Container(
        color: InheritedChatTheme.of(context).theme.secondaryColor,
        height: _size.height,
        width: _size.width,
      );
    } else if (_size.aspectRatio < 0.1 || _size.aspectRatio > 10) {
      return Container(
        color: user.id == widget.message.author.id
            ? InheritedChatTheme.of(context).theme.primaryColor
            : InheritedChatTheme.of(context).theme.secondaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              margin: EdgeInsetsDirectional.fromSTEB(
                InheritedChatTheme.of(context).theme.messageInsetsVertical,
                InheritedChatTheme.of(context).theme.messageInsetsVertical,
                16,
                InheritedChatTheme.of(context).theme.messageInsetsVertical,
              ),
              width: 64,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  fit: BoxFit.cover,
                  image: _image!,
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsetsDirectional.fromSTEB(
                  0,
                  InheritedChatTheme.of(context).theme.messageInsetsVertical,
                  InheritedChatTheme.of(context).theme.messageInsetsHorizontal,
                  InheritedChatTheme.of(context).theme.messageInsetsVertical,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.message.name,
                      style: user.id == widget.message.author.id
                          ? InheritedChatTheme.of(context)
                              .theme
                              .sentMessageBodyTextStyle
                          : InheritedChatTheme.of(context)
                              .theme
                              .receivedMessageBodyTextStyle,
                      textWidthBasis: TextWidthBasis.longestLine,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 4,
                      ),
                      child: Text(
                        formatBytes(widget.message.size.truncate()),
                        style: user.id == widget.message.author.id
                            ? InheritedChatTheme.of(context)
                                .theme
                                .sentMessageCaptionTextStyle
                            : InheritedChatTheme.of(context)
                                .theme
                                .receivedMessageCaptionTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        constraints: BoxConstraints(
          maxHeight: widget.messageWidth.toDouble(),
          minWidth: 170,
        ),
        child: AspectRatio(
          aspectRatio: _size.aspectRatio > 0 ? _size.aspectRatio : 1,
          child: Image(
            fit: BoxFit.contain,
            image: _image!,
          ),
        ),
      );
    }
  }
}
