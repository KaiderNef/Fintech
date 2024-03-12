import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:managment/Screens/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding(); // Navigate to the onboarding screen after a delay
  }

  void _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 5)); // Splash screen duration

    // Navigate to the onboarding screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Change to your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LottieBuilder.asset(
              'images/animation_lmkuwzy6.json', // Replace with your Lottie animation file
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Fintech 2023',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
