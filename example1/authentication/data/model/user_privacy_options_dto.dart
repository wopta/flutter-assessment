import 'package:json_annotation/json_annotation.dart';

part 'user_privacy_options_dto.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserPrivacyOptionsDto {
  final bool thirdPartyCommercialConsent;
  final bool dataConsent;
  final bool sensibleDataConsent;
  final bool commercialPurposeConsent;
  final bool marketingProfilingConsent;

  const UserPrivacyOptionsDto({
    required this.thirdPartyCommercialConsent,
    required this.dataConsent,
    required this.sensibleDataConsent,
    required this.commercialPurposeConsent,
    required this.marketingProfilingConsent,
  });

  factory UserPrivacyOptionsDto.fromJson(Map<String, dynamic> json) =>
      _$UserPrivacyOptionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserPrivacyOptionsDtoToJson(this);
}
