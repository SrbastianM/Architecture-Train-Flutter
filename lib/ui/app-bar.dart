import 'package:flutter/material.dart';

import 'navigation-drawer.dart';

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        drawer: NavigationDrawer(),
      );
}
