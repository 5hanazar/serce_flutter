import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final double? titleGap;
  final EdgeInsetsGeometry? padding;
  const DrawerMenuItem({super.key, required this.icon, required this.title, required this.onTap, required this.titleGap, required this.padding});

  @override
  Widget build(BuildContext context) {
    return ListTile(
    contentPadding: padding,
    horizontalTitleGap: titleGap,
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}