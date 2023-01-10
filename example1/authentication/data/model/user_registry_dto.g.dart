// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegistryDto _$UserRegistryDtoFromJson(Map json) => UserRegistryDto(
      registryType: json['txTipoAnagrafica'] as String?,
      registryTypeCode: json['cdTipoAnagrafica'] as String?,
      atecoCode: json['codiceAteco'] as String?,
      estabilishmentDate: json['dataCostituzione'] == null
          ? null
          : DateTime.parse(json['dataCostituzione'] as String),
      physicalPersonExtraData: json['datiAggPFisica'],
      legalPersonExtraData: json['datiAggPGiuridica'],
      userPrivacyOptions: json['datiPrivacy'] == null
          ? null
          : UserPrivacyOptionsWiseDto.fromJson(
              Map<String, dynamic>.from(json['datiPrivacy'] as Map)),
      atecoDescription: json['descrizioneAteco'] as String?,
      birthDate: json['dtNascita'] == null
          ? null
          : DateTime.parse(json['dtNascita'] as String),
      lastUpdatedAt: json['dtUltimaVariazione'] == null
          ? null
          : DateTime.parse(json['dtUltimaVariazione'] as String),
      id: json['id'] as num?,
      address: json['indirizzo'] == null
          ? null
          : UserAddressRegistryDto.fromJson(
              Map<String, dynamic>.from(json['indirizzo'] as Map)),
      contactDetails: json['listRecapiti'] as List<dynamic>?,
      fiscalCode: json['txCodiceFiscale'] as String?,
      surname: json['txCognome'] as String?,
      placeOfBirth: json['txComuneNascita'] as String?,
      fiscalResidencyNation: json['txNazioneIdentFiscale'] as String?,
      name: json['txNome'] as String?,
      vatNumber: json['txPartitaIva'] as String?,
      businessName: json['txRagioneSociale'] as String?,
      gender: json['txSesso'] as String?,
      cdUnivocoAnagrafica: json['cdUnivocoAnagrafica'] as String?,
      txRifEsternoAnagrafica: json['txRifEsternoAnagrafica'] as String?,
      cdTitolo: json['cdTitolo'] as String?,
      txTitolo: json['txTitolo'] as String?,
      cdSesso: json['cdSesso'] as String?,
      txNote: json['txNote'] as String?,
      cdMinComuneNascita: json['cdMinComuneNascita'] as String?,
      listContoCorrenti: json['listContoCorrenti'] as List<dynamic>?,
      listDocAnag: json['listDocAnag'] as List<dynamic>?,
      listIndirizzi: json['listIndirizzi'] as List<dynamic>?,
      cdNazioneUicIdentFiscale: json['cdNazioneUicIdentFiscale'] as String?,
      cdSae: json['cdSae'] as String?,
      bAggiornamentiDaServizio: json['bAggiornamentiDaServizio'] as bool?,
    );

Map<String, dynamic> _$UserRegistryDtoToJson(UserRegistryDto instance) =>
    <String, dynamic>{
      'txTipoAnagrafica': instance.registryType,
      'cdTipoAnagrafica': instance.registryTypeCode,
      'codiceAteco': instance.atecoCode,
      'dataCostituzione': instance.estabilishmentDate?.toIso8601String(),
      'datiAggPFisica': instance.physicalPersonExtraData,
      'datiAggPGiuridica': instance.legalPersonExtraData,
      'datiPrivacy': instance.userPrivacyOptions?.toJson(),
      'descrizioneAteco': instance.atecoDescription,
      'dtNascita': instance.birthDate?.toIso8601String(),
      'dtUltimaVariazione': instance.lastUpdatedAt?.toIso8601String(),
      'id': instance.id,
      'indirizzo': instance.address?.toJson(),
      'listRecapiti': instance.contactDetails,
      'txCodiceFiscale': instance.fiscalCode,
      'txCognome': instance.surname,
      'txComuneNascita': instance.placeOfBirth,
      'txNazioneIdentFiscale': instance.fiscalResidencyNation,
      'txNome': instance.name,
      'txPartitaIva': instance.vatNumber,
      'txRagioneSociale': instance.businessName,
      'txSesso': instance.gender,
      'cdUnivocoAnagrafica': instance.cdUnivocoAnagrafica,
      'txRifEsternoAnagrafica': instance.txRifEsternoAnagrafica,
      'cdTitolo': instance.cdTitolo,
      'txTitolo': instance.txTitolo,
      'cdSesso': instance.cdSesso,
      'txNote': instance.txNote,
      'cdMinComuneNascita': instance.cdMinComuneNascita,
      'listContoCorrenti': instance.listContoCorrenti,
      'listDocAnag': instance.listDocAnag,
      'listIndirizzi': instance.listIndirizzi,
      'cdNazioneUicIdentFiscale': instance.cdNazioneUicIdentFiscale,
      'cdSae': instance.cdSae,
      'bAggiornamentiDaServizio': instance.bAggiornamentiDaServizio,
    };
