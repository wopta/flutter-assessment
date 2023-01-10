// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentFormModel _$ComponentFormModelFromJson(Map json) => ComponentFormModel(
      name: json['name'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$ComponentFormModelToJson(ComponentFormModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'body': instance.body,
    };
