
import 'package:json_annotation/json_annotation.dart';

import '../../../../authentication/data/model/user_registry_dto.dart';

part 'insured_person.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class InsuredPerson {
  @JsonKey(name: 'anagrafica')
  final UserRegistryDto registry;

  InsuredPerson({required this.registry});

  factory InsuredPerson.fromJson(Map<String, dynamic> json) =>
      _$InsuredPersonFromJson(json);

  Map<String, dynamic> toJson() => _$InsuredPersonToJson(this);
}