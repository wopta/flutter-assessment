import 'package:json_annotation/json_annotation.dart';

part 'contract.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Contract {
  String? txRifIdPolContratto;
  String? dtScadenzaRata;
  String? dtEffettoRata;
  String? cdDurata;
  String? txDurata;
  String? cdFrazionamento;
  String? txFrazionamento;
  String? cdValuta;
  double? nImpLordo;
  double? nImpNetto;
  double? nImpScontiAumento;
  double? nImpTasse;
  double? nImpAccessori;
  String? dtAnnullamento;
  double? nImpLordoAnnuo;

  Contract({
    this.txRifIdPolContratto,
    this.dtScadenzaRata,
    this.dtEffettoRata,
    this.cdDurata,
    this.txDurata,
    this.cdFrazionamento,
    this.txFrazionamento,
    this.cdValuta,
    this.nImpLordo,
    this.nImpNetto,
    this.nImpScontiAumento,
    this.nImpTasse,
    this.nImpAccessori,
    this.dtAnnullamento,
    this.nImpLordoAnnuo,
  });

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);

  Map<String, dynamic> toJson() => _$ContractToJson(this);
}
