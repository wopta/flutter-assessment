// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guarantee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuaranteeDto _$GuaranceModelFromScratchFromJson(Map json) =>
    GuaranteeDto(
      cdGaranzia: json['cdGaranzia'] as String?,
      txGaranzia: json['txGaranzia'] as String?,
      cdTariffa: json['cdTariffa'] as String?,
      cdTipologiaGaranzia: json['cdTipologiaGaranzia'] as String?,
      dtScadenzaGaranzia: json['dtScadenzaGaranzia'] as String?,
      dtTariffa: json['dtTariffa'] == null
          ? null
          : DateTime.parse(json['dtTariffa'] as String),
      dtTentataVendita: json['dtTentataVendita'] as String?,
      nIdPrGaranzia: json['nIdPrGaranzia'] as int?,
      nIdPrGarTariffa: json['nIdPrGarTariffa'] as int?,
      nImpAnnuo: (json['nImpAnnuo'] as num?)?.toDouble(),
      nImpLordo: (json['nImpLordo'] as num?)?.toDouble(),
      nImpNetto: (json['nImpNetto'] as num?)?.toDouble(),
      nImpNettoOperazione: (json['nImpNettoOperazione'] as num?)?.toDouble(),
      nImpTasse: (json['nImpTasse'] as num?)?.toDouble(),
      nImpTasseAnnuo: (json['nImpTasseAnnuo'] as num?)?.toDouble(),
      nImpTasseOperazione: (json['nImpTasseOperazione'] as num?)?.toDouble(),
      txRifIdPolGaranzia: json['txRifIdPolGaranzia'] as String?,
      txTariffa: json['txTariffa'] as String?,
      txTipologiaGaranzia: json['txTipologiaGaranzia'] as String?,
      nImpFranchigia: (json['nImpFranchigia'] as num?)?.toDouble(),
      nImpMaxSinistro: (json['nImpMaxSinistro'] as num?)?.toDouble(),
      nPctScoperto: (json['nPctScoperto'] as num?)?.toDouble(),
      parameters: (json['elencoPtfParametri'] as List<dynamic>?)
          ?.map((e) =>
              GuaranteeParameter.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$GuaranceModelFromScratchToJson(
        GuaranteeDto instance) =>
    <String, dynamic>{
      'txRifIdPolGaranzia': instance.txRifIdPolGaranzia,
      'nIdPrGaranzia': instance.nIdPrGaranzia,
      'nIdPrGarTariffa': instance.nIdPrGarTariffa,
      'cdGaranzia': instance.cdGaranzia,
      'txGaranzia': instance.txGaranzia,
      'dtTariffa': instance.dtTariffa?.toIso8601String(),
      'cdTipologiaGaranzia': instance.cdTipologiaGaranzia,
      'txTipologiaGaranzia': instance.txTipologiaGaranzia,
      'nImpNetto': instance.nImpNetto,
      'nImpLordo': instance.nImpLordo,
      'nImpAnnuo': instance.nImpAnnuo,
      'nImpTasse': instance.nImpTasse,
      'nImpTasseAnnuo': instance.nImpTasseAnnuo,
      'dtTentataVendita': instance.dtTentataVendita,
      'dtScadenzaGaranzia': instance.dtScadenzaGaranzia,
      'nImpNettoOperazione': instance.nImpNettoOperazione,
      'nImpTasseOperazione': instance.nImpTasseOperazione,
      'cdTariffa': instance.cdTariffa,
      'txTariffa': instance.txTariffa,
      'nImpFranchigia': instance.nImpFranchigia,
      'nImpMaxSinistro': instance.nImpMaxSinistro,
      'nPctScoperto': instance.nPctScoperto,
      'elencoPtfParametri':
          instance.parameters?.map((e) => e.toJson()).toList(),
    };
