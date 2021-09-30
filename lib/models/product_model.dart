import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? description;
  String? picture;
  int? price;
  int? minPrice;
  List<Choices>? choices;

  Product(
      {this.id,
      this.title,
      this.description,
      this.picture,
      this.price,
      this.minPrice,
      this.choices});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Choices {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  List<Options>? options;
  int? min;
  int? max;

  Choices({this.id, this.title, this.options, this.min, this.max});

  factory Choices.fromJson(Map<String, dynamic> json) =>
      _$ChoicesFromJson(json);
  Map<String, dynamic> toJson() => _$ChoicesToJson(this);
}

@JsonSerializable()
class Options {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? description;
  int? price;
  bool? available;

  Options({this.id, this.title, this.description, this.price, this.available});

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
  Map<String, dynamic> toJson() => _$OptionsToJson(this);
}
