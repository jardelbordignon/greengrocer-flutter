import 'package:greengrocer/src/models/item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String id;
  String title;
  @JsonKey(defaultValue: [])
  List<ItemModel> items;
  @JsonKey(defaultValue: 0)
  int currentPage;

  CategoryModel({
    required this.id,
    required this.title,
    required this.items,
    required this.currentPage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  String toString() => 'CategoryModel(id: $id, title: $title, items: $items, currentPage: $currentPage)';
}
