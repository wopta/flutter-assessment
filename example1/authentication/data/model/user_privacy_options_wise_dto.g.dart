// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_privacy_options_wise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPrivacyOptionsWiseDto _$UserPrivacyOptionsWiseDtoFromJson(Map json) =>
    UserPrivacyOptionsWiseDto(
      thirdPartyCommercialConsent:
          json['bConsensoCommercialeVersoTerzi'] as bool,
      dataConsent: json['bConsensoDati'] as bool,
      sensibleDataConsent: json['bConsensoDatiSensibili'] as bool,
      commercialPurposeConsent: json['bConsensoFiniCommerciali'] as bool,
      marketingProfilingConsent: json['bConsensoProfilazioneMarketing'] as bool,
    );

Map<String, dynamic> _$UserPrivacyOptionsWiseDtoToJson(
        UserPrivacyOptionsWiseDto instance) =>
    <String, dynamic>{
      'bConsensoCommercialeVersoTerzi': instance.thirdPartyCommercialConsent,
      'bConsensoDati': instance.dataConsent,
      'bConsensoDatiSensibili': instance.sensibleDataConsent,
      'bConsensoFiniCommerciali': instance.commercialPurposeConsent,
      'bConsensoProfilazioneMarketing': instance.marketingProfilingConsent,
    };
