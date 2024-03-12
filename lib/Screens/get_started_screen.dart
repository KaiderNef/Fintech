import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:managment/Screens/login_page.dart';
import 'package:managment/Screens/signup_page.dart';


class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bắt đầu nào'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LottieBuilder.asset(
              'assets/animation_lmjs40ql.json', // Replace with your Lottie animation file
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bắt đầu với Fintech nào!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the signup screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const SignUpPage()), // Replace `SignUpScreen` with the actual name of your signup screen
                );
              },
              child: const Text('Đăng ký'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to the login screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginPage()), // Replace `LoginPage` with the actual name of your login screen
                );
              },
              child: const Text('Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}

