import 'package:flutter/material.dart';

import 'package:greengrocer/src/config/mocked_data.dart' as mocked_data;

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
        itemBuilder: (_, index) {
          return Text(mocked_data.orders[index].id);
        },
        itemCount: mocked_data.orders.length,
      ),
    );
  }
}
