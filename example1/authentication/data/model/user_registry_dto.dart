import 'package:json_annotation/json_annotation.dart';
import 'package:wopta/authentication/data/model/user_address_registry_dto.dart';
import 'package:wopta/authentication/data/model/user_privacy_options_wise_dto.dart';

part 'user_registry_dto.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserRegistryDto {
  @JsonKey(name: 'txTipoAnagrafica')
  final String? registryType;
  @JsonKey(name: 'cdTipoAnagrafica')
  final String? registryTypeCode;
  @JsonKey(name: 'codiceAteco')
  final String? atecoCode;
  @JsonKey(name: 'dataCostituzione')
  final DateTime? estabilishmentDate;
  @JsonKey(name: 'datiAggPFisica')
  final dynamic physicalPersonExtraData;
  @JsonKey(name: 'datiAggPGiuridica')
  final dynamic legalPersonExtraData;
  @JsonKey(name: 'datiPrivacy')
  final UserPrivacyOptionsWiseDto? userPrivacyOptions;
  @JsonKey(name: 'descrizioneAteco')
  final String? atecoDescription;
  @JsonKey(name: 'dtNascita')
  final DateTime? birthDate;
  @JsonKey(name: 'dtUltimaVariazione')
  final DateTime? lastUpdatedAt;
  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'indirizzo')
  final UserAddressRegistryDto? address;
  @JsonKey(name: 'listRecapiti')
  final List<dynamic>? contactDetails;
  @JsonKey(name: 'txCodiceFiscale')
  final String? fiscalCode;
  @JsonKey(name: 'txCognome')
  final String? surname;
  @JsonKey(name: 'txComuneNascita')
  final String? placeOfBirth;
  @JsonKey(name: 'txNazioneIdentFiscale')
  final String? fiscalResidencyNation;
  @JsonKey(name: 'txNome')
  final String? name;
  @JsonKey(name: 'txPartitaIva')
  final String? vatNumber;
  @JsonKey(name: 'txRagioneSociale')
  final String? businessName;
  @JsonKey(name: 'txSesso')
  final String? gender;
  final String? cdUnivocoAnagrafica;
  final String? txRifEsternoAnagrafica;
  final String? cdTitolo;
  final String? txTitolo;
  final String? cdSesso;
  final String? txNote;
  final String? cdMinComuneNascita;
  final List<dynamic>? listContoCorrenti;
  final List<dynamic>? listDocAnag;
  final List<dynamic>? listIndirizzi;
  final String? cdNazioneUicIdentFiscale;
  final String? cdSae;
  final bool? bAggiornamentiDaServizio;

  UserRegistryDto({
    this.registryType,
    this.registryTypeCode,
    this.atecoCode,
    this.estabilishmentDate,
    this.physicalPersonExtraData,
    this.legalPersonExtraData,
    this.userPrivacyOptions,
    this.atecoDescription,
    this.birthDate,
    this.lastUpdatedAt,
    this.id,
    this.address,
    this.contactDetails,
    this.fiscalCode,
    this.surname,
    this.placeOfBirth,
    this.fiscalResidencyNation,
    this.name,
    this.vatNumber,
    this.businessName,
    this.gender,
    this.cdUnivocoAnagrafica,
    this.txRifEsternoAnagrafica,
    this.cdTitolo,
    this.txTitolo,
    this.cdSesso,
    this.txNote,
    this.cdMinComuneNascita,
    this.listContoCorrenti,
    this.listDocAnag,
    this.listIndirizzi,
    this.cdNazioneUicIdentFiscale,
    this.cdSae,
    this.bAggiornamentiDaServizio,
  });

  factory UserRegistryDto.fromJson(Map<String, dynamic> json) =>
      _$UserRegistryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegistryDtoToJson(this);

  bool isBusinessRegistry() =>
      registryTypeCode == '2' || registryTypeCode == '3';

  bool isPersonRegistry() => registryTypeCode == '1';

  UserRegistryDto copyWith({
    String? registryType,
    String? registryTypeCode,
    String? atecoCode,
    DateTime? estabilishmentDate,
    dynamic physicalPersonExtraData,
    dynamic legalPersonExtraData,
    UserPrivacyOptionsWiseDto? userPrivacyOptions,
    String? atecoDescription,
    DateTime? birthDate,
    DateTime? lastUpdatedAt,
    num? id,
    UserAddressRegistryDto? address,
    List<dynamic>? contactDetails,
    String? fiscalCode,
    String? surname,
    String? placeOfBirth,
    String? fiscalResidencyNation,
    String? name,
    String? vatNumber,
    String? businessName,
    String? gender,
    String? cdUnivocoAnagrafica,
    String? txRifEsternoAnagrafica,
    String? cdTitolo,
    String? txTitolo,
    String? cdSesso,
    String? txSesso,
    String? txNote,
    String? cdMinComuneNascita,
    List<dynamic>? listContoCorrenti,
    List<dynamic>? listDocAnag,
    List<dynamic>? listIndirizzi,
    String? cdNazioneUicIdentFiscale,
    String? cdSae,
    bool? bAggiornamentiDaServizio,
  }) {
    return UserRegistryDto(
      registryType: registryType ?? this.registryType,
      registryTypeCode: registryTypeCode ?? this.registryTypeCode,
      atecoCode: atecoCode ?? this.atecoCode,
      estabilishmentDate: estabilishmentDate ?? this.estabilishmentDate,
      physicalPersonExtraData:
          physicalPersonExtraData ?? this.physicalPersonExtraData,
      legalPersonExtraData: legalPersonExtraData ?? this.legalPersonExtraData,
      userPrivacyOptions: userPrivacyOptions ?? this.userPrivacyOptions,
      atecoDescription: atecoDescription ?? this.atecoDescription,
      birthDate: birthDate ?? this.birthDate,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      address: address ?? this.address,
      // contactDetails: contactDetails ?? this.contactDetails,
      fiscalCode: fiscalCode ?? this.fiscalCode,
      surname: surname ?? this.surname,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      fiscalResidencyNation:
          fiscalResidencyNation ?? this.fiscalResidencyNation,
      name: name ?? this.name,
      vatNumber: vatNumber ?? this.vatNumber,
      businessName: businessName ?? this.businessName,
      gender: gender ?? this.gender,
      cdUnivocoAnagrafica: cdUnivocoAnagrafica ?? this.cdUnivocoAnagrafica,
      txRifEsternoAnagrafica:
          txRifEsternoAnagrafica ?? this.txRifEsternoAnagrafica,
      cdTitolo: cdTitolo ?? this.cdTitolo,
      txTitolo: txTitolo ?? this.txTitolo,
      cdSesso: cdSesso ?? this.cdSesso,
      txNote: txNote ?? this.txNote,
      cdMinComuneNascita: cdMinComuneNascita ?? this.cdMinComuneNascita,
      listContoCorrenti: listContoCorrenti ?? this.listContoCorrenti,
      listDocAnag: listDocAnag ?? this.listDocAnag,
      listIndirizzi: listIndirizzi ?? this.listIndirizzi,
      cdNazioneUicIdentFiscale:
          cdNazioneUicIdentFiscale ?? this.cdNazioneUicIdentFiscale,
      cdSae: cdSae ?? this.cdSae,
      bAggiornamentiDaServizio:
          bAggiornamentiDaServizio ?? this.bAggiornamentiDaServizio,
    );
  }
}
