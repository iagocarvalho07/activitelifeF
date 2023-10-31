
import 'package:activitelifef/ui/screens/authentication/createuserscreen/creat_user_screeen.dart';
import 'package:activitelifef/ui/screens/authentication/forgtpassword/forgot_password_screen.dart';
import 'package:activitelifef/ui/screens/authentication/loginscreen/login_screen.dart';
import 'package:activitelifef/ui/screens/authentication/splashscreen/splash_screen.dart';
import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        // Authentication routes
        AppRoute.SplashScreen: (ctx) =>  SplashScreen(),
        AppRoute.LoginScreen: (ctx) =>  LoginScreen(),
        AppRoute.ForgotPasswordScreen: (ctx) => ForgotPasswordScreen(),
        AppRoute.CreatUserScreen: (ctx) => CreatUserScreen(),

        // AppRoute.HomeScreen: (ctx) => CreatUserScreen(),


      },
    );
  }
}

