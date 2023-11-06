import 'package:activitelifef/firebase_options.dart';
import 'package:activitelifef/ui/screens/authentication/createuserscreen/creat_user_screeen.dart';
import 'package:activitelifef/ui/screens/authentication/forgtpassword/forgot_password_screen.dart';
import 'package:activitelifef/ui/screens/authentication/loginscreen/login_screen.dart';
import 'package:activitelifef/ui/screens/authentication/splashscreen/splash_screen.dart';
import 'package:activitelifef/ui/screens/bottomBarScreens/scaffold_screen.dart';
import 'package:activitelifef/ui/screens/drawer_menu_screens/buy_my_coffee.dart';
import 'package:activitelifef/ui/screens/drawer_menu_screens/my_workout_screen.dart';
import 'package:activitelifef/ui/screens/drawer_menu_screens/notification_screen.dart';
import 'package:activitelifef/ui/screens/drawer_menu_screens/settings_screeen.dart';
import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        AppRoute.SplashScreen: (ctx) => SplashScreen(),
        AppRoute.LoginScreen: (ctx) => LoginScreen(),
        AppRoute.ForgotPasswordScreen: (ctx) => ForgotPasswordScreen(),
        AppRoute.CreatUserScreen: (ctx) => CreatUserScreen(),
        AppRoute.ScaffoldScreen: (ctx) => ScaffoldScreen(),

        // DrawerMenu
        AppRoute.SettingsScreen: (ctx) => SettingsScreen(),
        AppRoute.BuyMyCoffe: (ctx) => BuyMyCoffe(),
        AppRoute.NotificationScreen: (ctx) => NotificationScreen(),
        AppRoute.MyWorkoutScreen: (ctx) => MyWorkoutScreen(),
      },
    );
  }
}
