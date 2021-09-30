// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      picture: json['picture'] as String?,
      price: json['price'] as int?,
      minPrice: json['minPrice'] as int?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'picture': instance.picture,
      'price': instance.price,
      'minPrice': instance.minPrice,
      'choices': instance.choices,
    };

Choices _$ChoicesFromJson(Map<String, dynamic> json) => Choices(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
          .toList(),
      min: json['min'] as int?,
      max: json['max'] as int?,
    );

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'options': instance.options,
      'min': instance.min,
      'max': instance.max,
    };

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      available: json['available'] as bool?,
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'available': instance.available,
    };
