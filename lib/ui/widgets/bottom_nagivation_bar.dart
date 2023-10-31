import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNagivationBar extends StatefulWidget {
  const MyBottomNagivationBar({super.key});

  @override
  State<MyBottomNagivationBar> createState() => _MyBottomNagivationBarState();
}

class _MyBottomNagivationBarState extends State<MyBottomNagivationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        onTabChange: (index){
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
    );
  }
}
