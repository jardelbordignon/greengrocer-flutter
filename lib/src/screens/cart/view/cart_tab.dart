import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/screens/cart/controller/cart_controller.dart';
import 'package:greengrocer/src/screens/cart/view/components/cart_tile.dart';
import 'package:greengrocer/src/screens/shared_widgets/payment_dialog.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  void removeItemFromCart(CartItemModel cartItem) {
    utilsServices.showToast(
      message: '${cartItem.item.name} removed from cart',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          // List of items
          Expanded(
            child: GetBuilder<CartController>(
              builder: (cartController) {
                return ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (_, index) {
                    return CartTile(
                      cartItem: cartController.cartItems[index],
                    );
                  },
                );
              },
            ),
          ),

          // Total and check out button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Total', style: TextStyle(fontSize: 12)),
                GetBuilder<CartController>(
                  builder: (cartController) {
                    return Text(
                      utilsServices.priceToCurrency(
                        cartController.cartTotalPrice(),
                      ),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.customSwatchColor,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? orderConfirmed = await showOrderConfirmation();
                      if (orderConfirmed ?? false) {
                        // showDialog(
                        //   context: context,
                        //   builder: (context) =>
                        //       PaymentDialog(order: mocked_data.orders.first),
                        // );
                      } else {
                        utilsServices.showToast(
                          message: 'You canceled the order',
                          type: ToastType.warning,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Check out',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Order Confirmation'),
          content: const Text('Do you really want to complete this order?'),
          actions: [
            // No button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.green),
              ),
            ),

            // Yes button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
