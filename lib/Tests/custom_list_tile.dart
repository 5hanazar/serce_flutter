import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final double height;
  
  // Параметры для текста
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? titleColor;
  final Color? subtitleColor;

  // Параметры для контейнера
  final BoxDecoration? containerDecoration;

  // Параметры Row и Column
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;

  // Параметры тени
  final List<BoxShadow>? boxShadows;

  // Настройки trailing
  final EdgeInsetsGeometry? trailingPadding;
  final Alignment? trailingAlignment;

  CustomListTile({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    this.backgroundColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.height = 60.0,
    this.titleStyle,
    this.subtitleStyle,
    this.containerDecoration,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.start,
    this.titleColor,
    this.subtitleColor,
    this.boxShadows,
    this.trailingPadding,
    this.trailingAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: height,
        decoration: containerDecoration ??
            BoxDecoration(
              borderRadius: borderRadius,
              color: backgroundColor,
              boxShadow: boxShadows ??
                  [
                    BoxShadow(color: Colors.black12, blurRadius: 4),
                  ],
            ),
        child: Container(color: Colors.green,
          child: Row(
            mainAxisAlignment: rowMainAxisAlignment,
            children: [
              if (leading != null) leading!,
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: columnCrossAxisAlignment,
                  children: [
                    title!,
                    if (subtitle != null)
                      subtitle!
                  ],
                ),
              ),
              if (trailing != null)
                Container(color:Colors.red,
                  child: Padding(
                    padding: trailingPadding ?? EdgeInsets.zero,
                    child: Align(
                      alignment: trailingAlignment ?? Alignment.centerRight,
                      child: trailing!,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
