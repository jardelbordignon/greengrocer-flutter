import './cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdAt;
  DateTime paymentOverdueAt;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createdAt,
    required this.paymentOverdueAt,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}
