// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetModel _$AssetModelFromJson(Map json) => AssetModel(
      value: (json['value'] as num).toDouble(),
      percent: (json['percent'] as num).toDouble(),
      type: json['type'] as String,
      ref: json['ref'],
    );

Map<String, dynamic> _$AssetModelToJson(AssetModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'percent': instance.percent,
      'type': instance.type,
      'ref': instance.ref,
    };
