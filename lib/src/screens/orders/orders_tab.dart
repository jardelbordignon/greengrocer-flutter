import 'package:flutter/material.dart';

import 'package:greengrocer/src/config/mocked_data.dart' as mocked_data;
import 'package:greengrocer/src/screens/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemBuilder: (_, index) => OrderTile(order: mocked_data.orders[index]),
        itemCount: mocked_data.orders.length,
      ),
    );
  }
}
