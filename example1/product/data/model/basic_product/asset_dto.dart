import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../complete_product/insured_person.dart';
import '../complete_product/location.dart';
import 'guarantee_dto.dart';

part 'asset_dto.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AssetDto extends Equatable {
  late int? nPrgApplicazione;
  late String? txRifIdPolBene;
  late String? cdTipoBene;
  late String? txTipoBene;
  late int? nPrgBene;
  late DateTime? dtInclusione;
  late DateTime? dtEsclusione;
  late String? txNoteBene;
  late List<GuaranteeDto>? elencoGaranzie;
  @JsonKey(name: 'ubicazione')
  final Location? location;
  @JsonKey(name: 'assicurato')
  final InsuredPerson? insuredPerson;

  AssetDto({
    this.nPrgApplicazione,
    this.cdTipoBene,
    this.dtEsclusione,
    this.dtInclusione,
    this.nPrgBene,
    this.txNoteBene,
    this.txRifIdPolBene,
    this.txTipoBene,
    this.elencoGaranzie,
    this.location,
    this.insuredPerson,
  });

  @override
  List<Object?> get props => [
        nPrgApplicazione,
        txRifIdPolBene,
        txTipoBene,
        txNoteBene,
        nPrgBene,
        dtInclusione,
        dtEsclusione,
        cdTipoBene,
        elencoGaranzie,
        location,
        insuredPerson
      ];

  static AssetDto getDefault() => AssetDto();

  factory AssetDto.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromScratchFromJson(json);

  Map<String, dynamic> toJson() => _$AssetModelFromScratchToJson(this);
}
