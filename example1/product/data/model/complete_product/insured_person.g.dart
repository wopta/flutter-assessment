// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insured_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuredPerson _$InsuredPersonFromJson(Map json) => InsuredPerson(
      registry: UserRegistryDto.fromJson(
          Map<String, dynamic>.from(json['anagrafica'] as Map)),
    );

Map<String, dynamic> _$InsuredPersonToJson(InsuredPerson instance) =>
    <String, dynamic>{
      'anagrafica': instance.registry.toJson(),
    };
