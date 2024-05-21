import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          // remove button
          _QuantityButton(
            color: Colors.grey,
            icon: Icons.remove,
            onTap: () {},
          ),

          // quantity
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '1 kg',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // add button
          _QuantityButton(
            color: Colors.green,
            icon: Icons.add,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
