import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:managment/Screens/signup_page.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _firstNameError = '';
  String _lastNameError = '';
  String _usernameError = '';
  String _phoneNumberError = '';
  String _emailError = '';
  String _passwordError = '';

  void _login() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final username = _usernameController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Perform validation for each field
    if (firstName.isEmpty) {
      setState(() {
        _firstNameError = 'Please enter your first name';
      });
    } else {
      setState(() {
        _firstNameError = '';
      });
    }

    if (lastName.isEmpty) {
      setState(() {
        _lastNameError = 'Please enter your last name';
      });
    } else {
      setState(() {
        _lastNameError = '';
      });
    }

    if (username.isEmpty) {
      setState(() {
        _usernameError = 'Please enter a username';
      });
    } else {
      setState(() {
        _usernameError = '';
      });
    }

    if (phoneNumber.isEmpty) {
      setState(() {
        _phoneNumberError = 'Please enter your phone number';
      });
    } else {
      setState(() {
        _phoneNumberError = '';
      });
    }

    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        _emailError = 'Please enter a valid email address';
      });
    } else {
      setState(() {
        _emailError = '';
      });
    }

    if (password.isEmpty || password.length < 6) {
      setState(() {
        _passwordError = 'Password must be at least 6 characters';
      });
    } else {
      setState(() {
        _passwordError = '';
      });
    }

    // if (_firstNameError.isEmpty &&
    //     _lastNameError.isEmpty &&
    //     _usernameError.isEmpty &&
    //     _phoneNumberError.isEmpty &&
    if (
        _emailError.isEmpty &&
        _passwordError.isEmpty) {
      // After successful login, navigate to the HomePage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Bottom()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset(
                    'images/animation_lml0c7oz.json', // Replace with your animation file path
                    width: 100,
                    height: 100,
                    repeat: true, // Set to true if you want the animation to loop
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: const Icon(Icons.email),
                      errorText: _emailError,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: const Icon(Icons.lock),
                      errorText: _passwordError,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                   const SizedBox(height: 16.0), // Added spacing
                Text(
                  'Wanna sign Up',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextButton(
                  onPressed: () {
                     Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SignUpPage()),
      );
                  },
                  child: const Text('Sign Up'),
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




