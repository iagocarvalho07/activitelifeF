import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_menu.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerMenu(),
    );
  }
}
