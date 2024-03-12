import 'package:flutter/material.dart';
import 'package:managment/Screens/get_started_screen.dart';
import 'package:managment/Screens/home.dart';
import 'package:managment/Screens/login_page.dart';
import 'package:managment/Screens/onboarding_screen.dart';
import 'package:managment/Screens/splash_screen.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/model/add_date.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintech',
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/get_started': (context) => const GetStartedScreen(),
        '/login': (context) => const LoginPage(),
        'home': (context) => const Home(),
    // Add other screens here
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
