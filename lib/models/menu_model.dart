import 'package:json_annotation/json_annotation.dart';
import 'product_model.dart';

part 'menu_model.g.dart';

@JsonSerializable()
class Menu {
  bool? success;
  List<MenuItems>? data;

  Menu({this.success, this.data});

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

@JsonSerializable()
class MenuItems {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? description;
  List<Product>? items;

  MenuItems({this.id, this.title, this.description, this.items});

  factory MenuItems.fromJson(Map<String, dynamic> json) =>
      _$MenuItemsFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemsToJson(this);
}
