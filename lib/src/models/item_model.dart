class ItemModel {
  String name;
  String imageUrl;
  String unit;
  String description;
  double price;

  // Constructor requiring all fields
  ItemModel({
    required this.name,
    required this.imageUrl,
    required this.unit,
    required this.description,
    required this.price,
  });
}

