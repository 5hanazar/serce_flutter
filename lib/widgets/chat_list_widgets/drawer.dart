import 'package:flutter/material.dart';

import 'drawer_menu_items.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key, required this.headerDrawer, required this.drawerAccount});
  final List<Widget> headerDrawer; 
  final List<Widget> drawerAccount; 
  
  final List<Widget> drawerMenu = [
    Divider(
      indent: 0,
      endIndent: 0,
    ),
    DrawerMenuItem(
      icon: Icons.play_arrow_rounded,
      title: 'My history',
      onTap: () {},
      titleGap: 24,
      padding: EdgeInsets.only(left: 18),
    ),
    Divider(
      indent: 0,
      endIndent: 0,
    ),
    DrawerMenuItem(
      titleGap: 24,
      padding: EdgeInsets.only(left: 18),
      icon: Icons.group,
      title: 'Create group',
      onTap: () {},
    ),
    DrawerMenuItem(
      titleGap: 24,
      padding: EdgeInsets.only(left: 18),
      icon: Icons.person,
      title: 'Contacts',
      onTap: () {},
    ),
    DrawerMenuItem(
      titleGap: 24,
      padding: EdgeInsets.only(left: 18),
      icon: Icons.call,
      title: 'Calls',
      onTap: () {},
    ),
    DrawerMenuItem(
      titleGap: 24,
      padding: EdgeInsets.only(left: 18),
      icon: Icons.person_pin_circle_rounded,
      title: 'People around',
      onTap: () {},
    ),
    DrawerMenuItem(
      titleGap: 24,
      padding: EdgeInsets.only(left: 18),
      icon: Icons.bookmark,
      title: 'Favorites',
      onTap: () {},
    ),
    DrawerMenuItem(
      titleGap: 24,
      padding: EdgeInsets.only(left: 18),
      icon: Icons.settings,
      title: 'Settings',
      onTap: () {},
    ),
    DrawerMenuItem(
      titleGap: 24,
      padding: EdgeInsets.only(left: 18),
      icon: Icons.person_add,
      title: 'Add friends',
      onTap: () {},
    ),
    DrawerMenuItem(
      titleGap: 24,
      padding: EdgeInsets.only(left: 18),
      icon: Icons.question_mark_rounded,
      title: 'Functions of Serce',
      onTap: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: headerDrawer.length +
                        drawerAccount.length +
                        drawerMenu.length +
                        1, // index.lenght + 1
                    itemBuilder: (context, index) {
                      if (index < headerDrawer.length) {
                        return headerDrawer[index];
                      } else if (index <
                          headerDrawer.length + drawerAccount.length) {
                        // index == index.legth
                        return drawerAccount[index - headerDrawer.length];
                      } else if (index ==
                          headerDrawer.length + drawerAccount.length) {
                        return ListTile(
                          horizontalTitleGap: 24,
                          contentPadding: EdgeInsets.only(left: 18),
                          leading: Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                          title: Text('Add account'),
                          onTap: () {},
                        );
                      } else {
                        return drawerMenu[index -
                            headerDrawer.length -
                            drawerAccount.length -
                            1];
                      }
                    }),
              )),
        ],
      ),
    );
  }
}
