import 'package:json_annotation/json_annotation.dart';

part 'user_privacy_options_wise_dto.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserPrivacyOptionsWiseDto {
  @JsonKey(name: 'bConsensoCommercialeVersoTerzi')
  final bool thirdPartyCommercialConsent;
  @JsonKey(name: 'bConsensoDati')
  final bool dataConsent;
  @JsonKey(name: 'bConsensoDatiSensibili')
  final bool sensibleDataConsent;
  @JsonKey(name: 'bConsensoFiniCommerciali')
  final bool commercialPurposeConsent;
  @JsonKey(name: 'bConsensoProfilazioneMarketing')
  final bool marketingProfilingConsent;

  UserPrivacyOptionsWiseDto({
    required this.thirdPartyCommercialConsent,
    required this.dataConsent,
    required this.sensibleDataConsent,
    required this.commercialPurposeConsent,
    required this.marketingProfilingConsent,
  });

  factory UserPrivacyOptionsWiseDto.fromJson(Map<String, dynamic> json) =>
      _$UserPrivacyOptionsWiseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPrivacyOptionsWiseDtoToJson(this);
}
