import 'package:flutter/material.dart';

class AttachmentOptions extends StatelessWidget {
  final VoidCallback onPhotoPressed;
  final VoidCallback onFilePressed;

  const AttachmentOptions({
    required this.onPhotoPressed,
    required this.onFilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: onPhotoPressed, child: Text('Photo')),
        TextButton(onPressed: onFilePressed, child: Text('File')),
      ],
    );
  }
}