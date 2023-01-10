import 'package:json_annotation/json_annotation.dart';
import 'package:wopta/authentication/data/model/user_privacy_options_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserDto {
  final String fiscalCode;
  final String? pictureUrl;
  final String? role;
  final String uid;
  final UserPrivacyOptionsDto? privacyOptions;
  final bool? emailVerified;

  UserDto(
      {required this.fiscalCode,
      required this.pictureUrl,
      required this.role,
      required this.uid,
      required this.privacyOptions,
      required this.emailVerified});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
