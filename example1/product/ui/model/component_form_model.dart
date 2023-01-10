import 'package:json_annotation/json_annotation.dart';

part 'component_form_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ComponentFormModel {
  late String name;
  late String description;
  late String type;
  late String body;

  ComponentFormModel({
    required this.name,
    required this.description,
    required this.type,
    required this.body,
  });
  factory ComponentFormModel.fromJson(Map<String, dynamic> json) =>
      _$ComponentFormModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentFormModelToJson(this);
}
