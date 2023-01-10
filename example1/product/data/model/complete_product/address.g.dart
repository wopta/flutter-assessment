// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map json) => Address(
      txRifIdIndirizzo: json['txRifIdIndirizzo'] as String?,
      cdTipoIndirizzo: json['cdTipoIndirizzo'] as String?,
      txTipoIndirizzo: json['txTipoIndirizzo'] as String?,
      txCap: json['txCap'] as String?,
      txDescIndirizzo: json['txDescIndirizzo'] as String?,
      txLocalita: json['txLocalita'] as String?,
      cdComuneMinisteriale: json['cdComuneMinisteriale'] as String?,
      txComune: json['txComune'] as String?,
      txSiglaProvincia: json['txSiglaProvincia'] as String?,
      cdNazioneUic: json['cdNazioneUic'] as String?,
      cdNazioneIso: json['cdNazioneIso'] as String?,
      txNazioneUic: json['txNazioneUic'] as String?,
      bPrincipale: json['bPrincipale'] as bool?,
      cdPrefissoToponomastico: json['cdPrefissoToponomastico'] as String?,
      txPrefissoToponomastico: json['txPrefissoToponomastico'] as String?,
      txToponimo: json['txToponimo'] as String?,
      txCivico: json['txCivico'] as String?,
      nLatitudine: (json['nLatitudine'] as num?)?.toDouble(),
      nLongitudine: (json['nLongitudine'] as num?)?.toDouble(),
      bGeolocalizzato: json['bGeolocalizzato'] as bool?,
      bIndirizzoNonCensito: json['bIndirizzoNonCensito'] as bool?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'txRifIdIndirizzo': instance.txRifIdIndirizzo,
      'cdTipoIndirizzo': instance.cdTipoIndirizzo,
      'txTipoIndirizzo': instance.txTipoIndirizzo,
      'txCap': instance.txCap,
      'txDescIndirizzo': instance.txDescIndirizzo,
      'txLocalita': instance.txLocalita,
      'cdComuneMinisteriale': instance.cdComuneMinisteriale,
      'txComune': instance.txComune,
      'txSiglaProvincia': instance.txSiglaProvincia,
      'cdNazioneUic': instance.cdNazioneUic,
      'cdNazioneIso': instance.cdNazioneIso,
      'txNazioneUic': instance.txNazioneUic,
      'bPrincipale': instance.bPrincipale,
      'cdPrefissoToponomastico': instance.cdPrefissoToponomastico,
      'txPrefissoToponomastico': instance.txPrefissoToponomastico,
      'txToponimo': instance.txToponimo,
      'txCivico': instance.txCivico,
      'nLatitudine': instance.nLatitudine,
      'nLongitudine': instance.nLongitudine,
      'bGeolocalizzato': instance.bGeolocalizzato,
      'bIndirizzoNonCensito': instance.bIndirizzoNonCensito,
    };
