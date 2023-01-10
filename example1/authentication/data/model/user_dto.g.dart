// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map json) => UserDto(
      fiscalCode: json['fiscalCode'] as String,
      pictureUrl: json['pictureUrl'] as String?,
      role: json['role'] as String?,
      uid: json['uid'] as String,
      privacyOptions: json['privacyOptions'] == null
          ? null
          : UserPrivacyOptionsDto.fromJson(
              Map<String, dynamic>.from(json['privacyOptions'] as Map)),
      emailVerified: json['emailVerified'] as bool?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'fiscalCode': instance.fiscalCode,
      'pictureUrl': instance.pictureUrl,
      'role': instance.role,
      'uid': instance.uid,
      'privacyOptions': instance.privacyOptions?.toJson(),
      'emailVerified': instance.emailVerified,
    };
