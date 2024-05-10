import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/app_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.green)),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                )),
            child: Column(
              children: [
                // Email
                const AppTextField(
                  icon: Icons.email,
                  label: 'Email',
                ),
                // Password
                const AppTextField(
                  icon: Icons.lock,
                  label: 'Password',
                  isSecret: true,
                ),
                // Button
                ElevatedButton(onPressed: () {}, child: const Text('Sign In')),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
