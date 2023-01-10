// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_privacy_options_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPrivacyOptionsDto _$UserPrivacyOptionsDtoFromJson(Map json) =>
    UserPrivacyOptionsDto(
      thirdPartyCommercialConsent: json['thirdPartyCommercialConsent'] as bool,
      dataConsent: json['dataConsent'] as bool,
      sensibleDataConsent: json['sensibleDataConsent'] as bool,
      commercialPurposeConsent: json['commercialPurposeConsent'] as bool,
      marketingProfilingConsent: json['marketingProfilingConsent'] as bool,
    );

Map<String, dynamic> _$UserPrivacyOptionsDtoToJson(
        UserPrivacyOptionsDto instance) =>
    <String, dynamic>{
      'thirdPartyCommercialConsent': instance.thirdPartyCommercialConsent,
      'dataConsent': instance.dataConsent,
      'sensibleDataConsent': instance.sensibleDataConsent,
      'commercialPurposeConsent': instance.commercialPurposeConsent,
      'marketingProfilingConsent': instance.marketingProfilingConsent,
    };
