import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween, // space between
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // align-items stretch
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

                  SizedBox(
                    height: 50,
                    //width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 18),
                        )),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
