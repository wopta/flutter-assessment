import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../complete_product/guarantee_parameter.dart';

part 'guarantee_dto.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class GuaranteeDto extends Equatable {
  late String? txRifIdPolGaranzia;
  late int? nIdPrGaranzia;
  late int? nIdPrGarTariffa;
  late String? cdGaranzia;
  late String? txGaranzia;
  late DateTime? dtTariffa;
  late String? cdTipologiaGaranzia;
  late String? txTipologiaGaranzia;
  late double? nImpNetto;
  late double? nImpLordo;
  late double? nImpAnnuo;
  late double? nImpTasse;
  late double? nImpTasseAnnuo;
  late String? dtTentataVendita;
  late String? dtScadenzaGaranzia;
  late double? nImpNettoOperazione;
  late double? nImpTasseOperazione;
  late String? cdTariffa;
  late String? txTariffa;
  late double? nImpFranchigia;
  late double? nImpMaxSinistro;
  late double? nPctScoperto;
  @JsonKey(name: 'elencoPtfParametri')
  List<GuaranteeParameter>? parameters;

  List<GuaranteeParameter>? getFomattedParameters() {
    return parameters?.map((param) {
      final paramValue = param.txValoreParametro!;

      if (num.tryParse(paramValue.replaceAll('.', '')) != null) {
        return param.copyWith(txValoreParametro: '$paramValue €');
      }

      return param;
    }).toList();
  }

  GuaranteeDto(
      {this.cdGaranzia,
      this.txGaranzia,
      this.cdTariffa,
      this.cdTipologiaGaranzia,
      this.dtScadenzaGaranzia,
      this.dtTariffa,
      this.dtTentataVendita,
      this.nIdPrGaranzia,
      this.nIdPrGarTariffa,
      this.nImpAnnuo,
      this.nImpLordo,
      this.nImpNetto,
      this.nImpNettoOperazione,
      this.nImpTasse,
      this.nImpTasseAnnuo,
      this.nImpTasseOperazione,
      this.txRifIdPolGaranzia,
      this.txTariffa,
      this.txTipologiaGaranzia,
      this.nImpFranchigia,
      this.nImpMaxSinistro,
      this.nPctScoperto,
      this.parameters});

  @override
  List<Object?> get props => [
        cdGaranzia,
        txGaranzia,
        txTipologiaGaranzia,
        txTariffa,
        txRifIdPolGaranzia,
        nImpTasseOperazione,
        nImpTasseAnnuo,
        nImpTasse,
        nImpNettoOperazione,
        nImpNetto,
        nImpLordo,
        nImpAnnuo,
        nIdPrGaranzia,
        nIdPrGarTariffa,
        dtTentataVendita,
        dtTariffa,
        dtScadenzaGaranzia,
        cdTipologiaGaranzia,
        cdTariffa,
        nImpFranchigia,
        nImpMaxSinistro,
        nPctScoperto,
        parameters
      ];

  static GuaranteeDto getDefault() => GuaranteeDto();

  factory GuaranteeDto.fromJson(Map<String, dynamic> json) =>
      _$GuaranceModelFromScratchFromJson(json);

  Map<String, dynamic> toJson() => _$GuaranceModelFromScratchToJson(this);
}
