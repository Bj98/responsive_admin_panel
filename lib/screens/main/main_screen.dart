import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_admin_panel/controllers/MenuController.dart';
import 'package:responsive_admin_panel/screens/dashboard/dashboard_screen.dart';
import 'package:responsive_admin_panel/screens/main/components/side_menu.dart';

import '../../responsive.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
            Expanded(flex: 5, child: DashboardScreen())
          ],
        ),
      ),
    );
  }
}
