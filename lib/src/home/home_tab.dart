import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(TextSpan(
          style: const TextStyle(fontSize: 30),
          children: [
            const TextSpan(
              text: 'Green',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: 'grocer',
              style: TextStyle(
                color: CustomColors.customContrastColor,
              ),
            ),
          ],
        )),
        actions: [
          // Cart button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // Search bar

      // Categories selector

      // Store grid
    );
  }
}
