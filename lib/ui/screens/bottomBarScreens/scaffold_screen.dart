import 'package:activitelifef/ui/screens/bottomBarScreens/homeScreen/home_screen.dart';
import 'package:activitelifef/ui/screens/bottomBarScreens/profileScreen/profile_screen.dart';
import 'package:activitelifef/ui/screens/bottomBarScreens/treinoScreen/exercices_screen.dart';
import 'package:activitelifef/ui/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ScaffoldScreen extends StatefulWidget {
  const ScaffoldScreen({super.key});

  @override
  State<ScaffoldScreen> createState() => _ScaffoldScreenState();
}

class _ScaffoldScreenState extends State<ScaffoldScreen> {
  int myCurrentIndex = 0;

  List screens = const [
    HomeScreen(),
    ExerceciesSceen(),
    ProfileScreen(),
  ];
  List AppBarName = const ['Home', "Exercicios", "Perfil"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppBarName[myCurrentIndex]),
          centerTitle: true,
        ),
        drawer: DrawerMenu(),
        body: screens[myCurrentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: GNav(
            rippleColor: Colors.grey,
            hoverColor: Colors.grey,
            tabBorderRadius: 15.0,
            activeColor: Colors.white,
            gap: 8,
            curve: Curves.easeOutExpo,
            iconSize: 32,
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.orange,
            tabBackgroundColor: Colors.orangeAccent,
            onTabChange: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.sports_gymnastics,
                text: "Exercicios",
              ),
              GButton(
                icon: Icons.person,
                text: "Perfil",
              ),
            ],
          ),
        ));
  }
}