import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/config/mocked_data.dart';
import 'package:greengrocer/src/screens/home/components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = categories[0];

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
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: CustomColors.customContrastColor,
                label: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Search products...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 24,
                ),
              ),
            ),
          ),

          // Categories selector
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx, int index) => CategoryTile(
                onTap: () {
                  setState(() {
                    selectedCategory = categories[index];
                  });
                },
                category: categories[index], // Named parameter
                isSelected:
                    categories[index] == selectedCategory, // Named parameter
              ),
              separatorBuilder: (BuildContext ctx, int index) =>
                  const SizedBox(width: 10),
              itemCount: categories.length,
            ),
          ),

          // Store grid
        ],
      ),
    );
  }
}
