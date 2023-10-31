import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          buildHearder(context),
          BuildMenuItems(context),
        ],
      ),
    );
  }
}

Widget buildHearder(BuildContext context) => Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      ),
    );

Widget BuildMenuItems(BuildContext context) => Container(
      padding: EdgeInsets.all(24),
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.house_sharp),
            title: const Text("Pagina Principal"),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.ScaffoldScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.sports_gymnastics),
            title: const Text("Meus Treinos"),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.MyWorkoutScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: const Text("Notifications"),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.NotificationScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: const Text("Buy My Coffee"),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.BuyMyCoffe);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.SettingsScreen);
            },
          )
        ],
      ),
    );
