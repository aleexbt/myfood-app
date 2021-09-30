import 'package:json_annotation/json_annotation.dart';

part 'optional_model.g.dart';

@JsonSerializable()
class Optionals {
  Map<String, dynamic>? optionals;

  Optionals({this.optionals});

  factory Optionals.fromJson(Map<String, dynamic> json) => Optionals(
        optionals: json['optionals'] != null
            ? Map.from(json['optionals'])
                .map((k, v) => MapEntry<String, dynamic>(k, v))
            : null,
      );
  Map<String, dynamic> toJson() => _$OptionalsToJson(this);
}
