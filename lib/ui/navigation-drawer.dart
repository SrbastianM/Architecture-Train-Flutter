import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
    return Container();
  }

  buildHeader(BuildContext context) {}

  buildMenuItems(BuildContext context) {
    Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.home_mini_outlined,
          ),
          title: const Text("Home"),
          onTap: () {},
        )
      ],
    );
  }
}
