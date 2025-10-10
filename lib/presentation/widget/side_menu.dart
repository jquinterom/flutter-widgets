import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (index) {
        setState(() {
          navDrawerIndex = index;
        });

        final menuItem = appMenuItems[index];
        context.push(menuItem.link);

        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        ...appMenuItems
            .sublist(0, 3)
            .map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: Text(menuItem.title),
              ),
            ),

        const Padding(
          padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
          child: Text("More options"),
        ),

        ...appMenuItems
            .sublist(3)
            .map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: Text(menuItem.title),
              ),
            ),
      ],
    );
  }
}
