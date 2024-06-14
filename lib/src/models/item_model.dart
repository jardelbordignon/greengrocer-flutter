import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

/* format of response from api
[{
  "id": "",
  "title": "",
  "description": "",
  "price": 0,
  "unit": "",
  "picture": "",
  "category": {"title": "", "id": ""}
}]
*/

@JsonSerializable()
class ItemModel {
  String id;
  @JsonKey(name: 'title')
  String name;
  @JsonKey(name: 'picture')
  String imageUrl;
  String unit;
  String description;
  double price;

  // Constructor requiring all fields
  ItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.unit,
    required this.description,
    required this.price,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  String toString() {
    return 'ItemModel(id: $id, name: $name, imageUrl: $imageUrl, unit: $unit, description: $description, price: $price)';
  }
}
