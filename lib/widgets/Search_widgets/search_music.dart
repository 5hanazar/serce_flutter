import 'package:flutter/material.dart';

class MySearchMusic extends StatelessWidget {
  const MySearchMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            indent: 70,
          );
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          final TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
          final TextStyle? titleMedium =
              Theme.of(context).textTheme.titleMedium;
          final TextStyle? displaySmall =
              Theme.of(context).textTheme.displaySmall;
          return ListTile(
            titleTextStyle: titleMedium,
            subtitleTextStyle: titleSmall,
            leadingAndTrailingTextStyle: displaySmall,
            leading: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.play_arrow_outlined),
                onPressed: () {},
              ),
            ),
            title: Text('Title of music'),
            subtitle: Text('Room of music'),
            trailing: Text('23 oct'),
          );
        });
  }
}
