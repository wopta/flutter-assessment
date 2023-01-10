import 'package:json_annotation/json_annotation.dart';

part 'user_address_registry_dto.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserAddressRegistryDto {
  @JsonKey(name: 'bPrincipale')
  final bool? isMainAddress;
  @JsonKey(name: 'cdNazioneIso')
  final String? isoCountryCode;
  @JsonKey(name: 'cdNazioneUic')
  final String? uicCountryCode;
  @JsonKey(name: 'cdTipoIndirizzo')
  final String? addressTypeCode;
  @JsonKey(name: 'nLatitudine')
  final num? latitude;
  @JsonKey(name: 'nLongitudine')
  final num? longitude;
  @JsonKey(name: 'txCap')
  final String? postalCode;
  @JsonKey(name: 'txCivico')
  final String? houseNumber;
  @JsonKey(name: 'txComune')
  final String? municipality;
  @JsonKey(name: 'txDescIndirizzo')
  final String? addressDescription;
  @JsonKey(name: 'txLocalita')
  final String? location;
  @JsonKey(name: 'txNazioneUic')
  final String? countryName;
  @JsonKey(name: 'txRifIdIndirizzo')
  final String? addressId;
  @JsonKey(name: 'txSiglaProvincia')
  final String? province;
  @JsonKey(name: 'txTipoIndirizzo')
  final String? addressType;
  final String? cdComuneMinisteriale;
  final String? cdPrefissoToponomastico;
  final String? txPrefissoToponomastico;
  final String? txToponimo;
  final bool? bGeolocalizzato;
  final bool? bIndirizzoNonCensito;

  UserAddressRegistryDto({
    this.isMainAddress,
    this.isoCountryCode,
    this.uicCountryCode,
    this.addressTypeCode,
    this.latitude,
    this.longitude,
    this.postalCode,
    this.houseNumber,
    this.municipality,
    this.addressDescription,
    this.location,
    this.countryName,
    this.addressId,
    this.province,
    this.addressType,
    this.cdComuneMinisteriale,
    this.cdPrefissoToponomastico,
    this.txPrefissoToponomastico,
    this.txToponimo,
    this.bGeolocalizzato,
    this.bIndirizzoNonCensito,
  });

  factory UserAddressRegistryDto.fromJson(Map<String, dynamic> json) =>
      _$UserAddressRegistryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressRegistryDtoToJson(this);
}
