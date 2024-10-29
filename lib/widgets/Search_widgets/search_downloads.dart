import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MySearchDownload extends StatelessWidget {
  MySearchDownload({super.key});
  @override
  Widget build(BuildContext context) {
    final TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    final TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    final TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall;

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 30),
          child: Container(
            color: myrecentChatsContainerPrimary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Downloads',
                    style: titleSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      print('Clicked!');
                    },
                    child: Text(
                      'Download all',
                      style: titleSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(indent: 60);
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){},
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              height: 50,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: 30,
                                ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Video',
                                        style: titleMedium,
                                      ),
                                    ),
                                    ConstrainedBox(
                                        constraints:
                                            BoxConstraints(minHeight: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.download,
                                              size: 14,
                                              color: mysecondary,
                                            ),
                                            Text(
                                              '24 MB',
                                              style: titleSmall,
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                            )
                          ],
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(right: 25, top: 10, bottom: 5),
                            child: Text('23 oct', style: displaySmall))
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
