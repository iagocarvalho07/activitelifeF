import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      // if (FirebaseAuth.instance.currentUser?.email?.isEmpty ?? true) {
      //   // Navegar para a tela de login
      // } else {
      //   // Navegar para a tela inicial
      // }
      Navigator.of(context).pushNamed(AppRoute.LoginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    const String image = 'lib/assets/imagens/backgroundsrainersplash.jpg';
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          Opacity(
            opacity: 0.4,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome To",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                  Text(
                    "Active Life",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[700]),
                  ),
                  const Text(
                    "Discover the best shape of your body. Click below to continue.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
