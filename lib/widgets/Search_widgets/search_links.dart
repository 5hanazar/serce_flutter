import 'package:flutter/material.dart';

// class MySearchLink extends StatelessWidget {
//   const MySearchLink({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
//     final TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
//     return ListView.separated(
//         separatorBuilder: (context, index) {
//           return Divider(indent: 70,);
//         },
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return ListTile(
//             titleTextStyle: titleMedium,
//             subtitleTextStyle: titleSmall,
//             leading: Container(
//               padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(0),
//                 color: mysearchLinkContainerPrimary,
//               ),
//               child: Text(
//                 'T',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             title: Text('Title of link'),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('https://google.com'),
//                 Text('https://google.com'),
//                 Text(
//                   'Name of channel or room',
//                   style: TextStyle(color: Colors.black),
//                 )
//               ],
//             ),
//           );
//         });
//   }
// }

class MySearchLink extends StatelessWidget {
  const MySearchLink({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    final TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    final TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            indent: 70,
          );
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                        margin: EdgeInsets.only(bottom: 25, left: 5),
                        height: 50,
                        width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title of link',
                                style: titleMedium,
                              ),
                              Text(
                                'Link 1',
                                style: titleSmall,
                              ),
                              Text(
                                'Link 2',
                                style: titleSmall,
                              ),
                              Text(
                                'Channel or room',
                                style: titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
