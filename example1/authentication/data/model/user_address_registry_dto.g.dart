// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_registry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressRegistryDto _$UserAddressRegistryDtoFromJson(Map json) =>
    UserAddressRegistryDto(
      isMainAddress: json['bPrincipale'] as bool?,
      isoCountryCode: json['cdNazioneIso'] as String?,
      uicCountryCode: json['cdNazioneUic'] as String?,
      addressTypeCode: json['cdTipoIndirizzo'] as String?,
      latitude: json['nLatitudine'] as num?,
      longitude: json['nLongitudine'] as num?,
      postalCode: json['txCap'] as String?,
      houseNumber: json['txCivico'] as String?,
      municipality: json['txComune'] as String?,
      addressDescription: json['txDescIndirizzo'] as String?,
      location: json['txLocalita'] as String?,
      countryName: json['txNazioneUic'] as String?,
      addressId: json['txRifIdIndirizzo'] as String?,
      province: json['txSiglaProvincia'] as String?,
      addressType: json['txTipoIndirizzo'] as String?,
      cdComuneMinisteriale: json['cdComuneMinisteriale'] as String?,
      cdPrefissoToponomastico: json['cdPrefissoToponomastico'] as String?,
      txPrefissoToponomastico: json['txPrefissoToponomastico'] as String?,
      txToponimo: json['txToponimo'] as String?,
      bGeolocalizzato: json['bGeolocalizzato'] as bool?,
      bIndirizzoNonCensito: json['bIndirizzoNonCensito'] as bool?,
    );

Map<String, dynamic> _$UserAddressRegistryDtoToJson(
        UserAddressRegistryDto instance) =>
    <String, dynamic>{
      'bPrincipale': instance.isMainAddress,
      'cdNazioneIso': instance.isoCountryCode,
      'cdNazioneUic': instance.uicCountryCode,
      'cdTipoIndirizzo': instance.addressTypeCode,
      'nLatitudine': instance.latitude,
      'nLongitudine': instance.longitude,
      'txCap': instance.postalCode,
      'txCivico': instance.houseNumber,
      'txComune': instance.municipality,
      'txDescIndirizzo': instance.addressDescription,
      'txLocalita': instance.location,
      'txNazioneUic': instance.countryName,
      'txRifIdIndirizzo': instance.addressId,
      'txSiglaProvincia': instance.province,
      'txTipoIndirizzo': instance.addressType,
      'cdComuneMinisteriale': instance.cdComuneMinisteriale,
      'cdPrefissoToponomastico': instance.cdPrefissoToponomastico,
      'txPrefissoToponomastico': instance.txPrefissoToponomastico,
      'txToponimo': instance.txToponimo,
      'bGeolocalizzato': instance.bGeolocalizzato,
      'bIndirizzoNonCensito': instance.bIndirizzoNonCensito,
    };
