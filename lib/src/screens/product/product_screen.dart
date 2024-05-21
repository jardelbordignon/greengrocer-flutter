import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/screens/shared_widgets/quantity_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ProductScreen extends StatelessWidget {
  final ItemModel item;

  const ProductScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // Content
          Column(
            children: [
              // Image
              Expanded(
                child: Hero(
                  tag: item.imageUrl,
                  child: Image.asset(item.imageUrl),
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // name - quantity
                      Row(
                        children: [
                          // name
                          Expanded(
                            child: Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // quantity
                          const QuantityWidget(),
                        ],
                      ),

                      // price
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                      // description
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              item.description,
                              style: const TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Add to cart button
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        label: const Text(
                          'Add to cart',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        icon: const Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

          // Back button
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
