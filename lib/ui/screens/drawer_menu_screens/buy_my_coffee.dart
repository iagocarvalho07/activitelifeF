import 'package:activitelifef/ui/widgets/drawer_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyMyCoffe extends StatelessWidget {
  const BuyMyCoffe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerMenu(),
    );
  }
}
