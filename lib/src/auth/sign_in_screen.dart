import 'package:flutter/material.dart';

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
                const TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                // Password
                const TextField(),
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
