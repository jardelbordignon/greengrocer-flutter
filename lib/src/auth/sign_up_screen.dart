import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/app_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),

          // Formulary
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 40,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppTextField(
                  icon: Icons.email,
                  label: 'Email',
                ),
                const AppTextField(
                  icon: Icons.lock,
                  label: 'Password',
                  isSecret: true,
                ),
                const AppTextField(
                  icon: Icons.person,
                  label: 'Name',
                ),
                const AppTextField(
                  icon: Icons.phone,
                  label: 'Phone',
                ),
                const AppTextField(
                  icon: Icons.file_copy,
                  label: 'Document Number',
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Sign Up Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
