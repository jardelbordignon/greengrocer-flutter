import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isPaymentOverdue;

  const OrderStatusWidget({
    super.key,
    required this.status,
    required this.isPaymentOverdue,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDot(
          isActive: true,
          title: 'Pending',
        ),
        _StatusDot(
          isActive: true,
          title: 'Sended',
        ),
        _StatusDot(
          isActive: false,
          title: 'Delivered',
        ),
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;

  const _StatusDot({
    super.key,
    required this.isActive,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CustomColors.customSwatchColor),
            color:
                isActive ? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isActive
              ? const Icon(Icons.check, size: 13, color: Colors.white)
              : null,
        ),

        // Spacer
        const SizedBox(width: 5),

        // Text
        Expanded(
          child: Text(title),
        ),
      ],
    );
  }
}
