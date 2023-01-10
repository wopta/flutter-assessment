// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map json) => Product(
      attachments: (json['elencoAllegati'] as List<dynamic>?)
          ?.map(
              (e) => ProductAnnex.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      assets: (json['elencoBeni'] as List<dynamic>?)
          ?.map((e) => AssetDto.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      expiryDate: DateTime.parse(json['dtScadenza'] as String),
      policyNumber: json['txNPolizza'] as String,
      policyId: json['idPolizza'] as int,
      contract: Contract.fromJson(
          Map<String, dynamic>.from(json['contratto'] as Map)),
      productTypeCode: json['cdProdotto'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'elencoAllegati': instance.attachments?.map((e) => e.toJson()).toList(),
      'elencoBeni': instance.assets?.map((e) => e.toJson()).toList(),
      'dtScadenza': instance.expiryDate.toIso8601String(),
      'txNPolizza': instance.policyNumber,
      'idPolizza': instance.policyId,
      'contratto': instance.contract.toJson(),
      'cdProdotto': instance.productTypeCode,
    };
