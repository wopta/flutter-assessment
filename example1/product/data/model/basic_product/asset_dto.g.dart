// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetDto _$AssetModelFromScratchFromJson(Map json) =>
    AssetDto(
      nPrgApplicazione: json['nPrgApplicazione'] as int?,
      cdTipoBene: json['cdTipoBene'] as String?,
      dtEsclusione: json['dtEsclusione'] == null
          ? null
          : DateTime.parse(json['dtEsclusione'] as String),
      dtInclusione: json['dtInclusione'] == null
          ? null
          : DateTime.parse(json['dtInclusione'] as String),
      nPrgBene: json['nPrgBene'] as int?,
      txNoteBene: json['txNoteBene'] as String?,
      txRifIdPolBene: json['txRifIdPolBene'] as String?,
      txTipoBene: json['txTipoBene'] as String?,
      elencoGaranzie: (json['elencoGaranzie'] as List<dynamic>?)
          ?.map((e) => GuaranteeDto.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      location: json['ubicazione'] == null
          ? null
          : Location.fromJson(
              Map<String, dynamic>.from(json['ubicazione'] as Map)),
      insuredPerson: json['assicurato'] == null
          ? null
          : InsuredPerson.fromJson(
              Map<String, dynamic>.from(json['assicurato'] as Map)),
    );

Map<String, dynamic> _$AssetModelFromScratchToJson(
        AssetDto instance) =>
    <String, dynamic>{
      'nPrgApplicazione': instance.nPrgApplicazione,
      'txRifIdPolBene': instance.txRifIdPolBene,
      'cdTipoBene': instance.cdTipoBene,
      'txTipoBene': instance.txTipoBene,
      'nPrgBene': instance.nPrgBene,
      'dtInclusione': instance.dtInclusione?.toIso8601String(),
      'dtEsclusione': instance.dtEsclusione?.toIso8601String(),
      'txNoteBene': instance.txNoteBene,
      'elencoGaranzie':
          instance.elencoGaranzie?.map((e) => e.toJson()).toList(),
      'ubicazione': instance.location?.toJson(),
      'assicurato': instance.insuredPerson?.toJson(),
    };
