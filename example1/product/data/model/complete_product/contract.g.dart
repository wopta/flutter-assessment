// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contract _$ContractFromJson(Map json) => Contract(
      txRifIdPolContratto: json['txRifIdPolContratto'] as String?,
      dtScadenzaRata: json['dtScadenzaRata'] as String?,
      dtEffettoRata: json['dtEffettoRata'] as String?,
      cdDurata: json['cdDurata'] as String?,
      txDurata: json['txDurata'] as String?,
      cdFrazionamento: json['cdFrazionamento'] as String?,
      txFrazionamento: json['txFrazionamento'] as String?,
      cdValuta: json['cdValuta'] as String?,
      nImpLordo: (json['nImpLordo'] as num?)?.toDouble(),
      nImpNetto: (json['nImpNetto'] as num?)?.toDouble(),
      nImpScontiAumento: (json['nImpScontiAumento'] as num?)?.toDouble(),
      nImpTasse: (json['nImpTasse'] as num?)?.toDouble(),
      nImpAccessori: (json['nImpAccessori'] as num?)?.toDouble(),
      dtAnnullamento: json['dtAnnullamento'] as String?,
      nImpLordoAnnuo: (json['nImpLordoAnnuo'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'txRifIdPolContratto': instance.txRifIdPolContratto,
      'dtScadenzaRata': instance.dtScadenzaRata,
      'dtEffettoRata': instance.dtEffettoRata,
      'cdDurata': instance.cdDurata,
      'txDurata': instance.txDurata,
      'cdFrazionamento': instance.cdFrazionamento,
      'txFrazionamento': instance.txFrazionamento,
      'cdValuta': instance.cdValuta,
      'nImpLordo': instance.nImpLordo,
      'nImpNetto': instance.nImpNetto,
      'nImpScontiAumento': instance.nImpScontiAumento,
      'nImpTasse': instance.nImpTasse,
      'nImpAccessori': instance.nImpAccessori,
      'dtAnnullamento': instance.dtAnnullamento,
      'nImpLordoAnnuo': instance.nImpLordoAnnuo,
    };
