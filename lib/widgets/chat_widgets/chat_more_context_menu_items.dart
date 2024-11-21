import 'package:flutter/material.dart';

class ChatMoreContextMenuItems extends StatelessWidget {
  const ChatMoreContextMenuItems({required this.title, required this.leading, required this.style, required this.onTap, this.firstItemTrailing, Key? key}) : super(key: key);
  final String? title;
  final IconData? leading;
  final Widget? firstItemTrailing;
  final TextStyle? style;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
    title: Text(title!, style: style,),
    leading: Icon(leading),
    onTap: onTap,
    trailing: firstItemTrailing,
    );
  }
}