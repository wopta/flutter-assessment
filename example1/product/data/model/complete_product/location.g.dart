// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map json) => Location(
      txRifIdPolUbicazione: json['txRifIdPolUbicazione'] as String?,
      txNoteUbicazione: json['txNoteUbicazione'] as String?,
      nAnnoCostruzione: json['nAnnoCostruzione'] as int?,
      cdTipoFabbricato: json['cdTipoFabbricato'] as String?,
      txTipoFabbricato: json['txTipoFabbricato'] as String?,
      cdTipoRipartizione: json['cdTipoRipartizione'] as String?,
      txTipoRipartizione: json['txTipoRipartizione'] as String?,
      cdAttivita: json['cdAttivita'] as String?,
      txAttivita: json['txAttivita'] as String?,
      bAbitazionePrincipale: json['bAbitazionePrincipale'] as bool?,
      nValoreImmobile: (json['nValoreImmobile'] as num?)?.toDouble(),
      indirizzo: json['indirizzo'] == null
          ? null
          : Address.fromJson(
              Map<String, dynamic>.from(json['indirizzo'] as Map)),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'txRifIdPolUbicazione': instance.txRifIdPolUbicazione,
      'txNoteUbicazione': instance.txNoteUbicazione,
      'nAnnoCostruzione': instance.nAnnoCostruzione,
      'cdTipoFabbricato': instance.cdTipoFabbricato,
      'txTipoFabbricato': instance.txTipoFabbricato,
      'cdTipoRipartizione': instance.cdTipoRipartizione,
      'txTipoRipartizione': instance.txTipoRipartizione,
      'cdAttivita': instance.cdAttivita,
      'txAttivita': instance.txAttivita,
      'bAbitazionePrincipale': instance.bAbitazionePrincipale,
      'nValoreImmobile': instance.nValoreImmobile,
      'indirizzo': instance.indirizzo?.toJson(),
    };
