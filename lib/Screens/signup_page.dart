import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:managment/Screens/login_page.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Inside SignUpPage build methodlib\assets\animation_lmjs40ql.json
              Lottie.asset(
                'images/animation_lmjs40ql.json', // Replace with your animation file path
                width: 200,
                height: 200,
                repeat: true, // Set to true if you want the animation to loop
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'User Name',
                  icon: Icon(Icons.account_circle),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  icon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Implement your signup logic here
                  // Typically, you'd send the user's data to a server or database
                  // and handle the response accordingly.
                  // For this example, we'll show a success message.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sign Up Successful!'),
                    ),
                  );

                  // After successful signup, navigate to the login page
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const Bottom()),
                  );
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Navigate to the login page directly
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text('Already have an account? Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


