import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_menu.dart';

class MyWorkoutScreen extends StatelessWidget {
  const MyWorkoutScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerMenu(),
    );
  }
}
