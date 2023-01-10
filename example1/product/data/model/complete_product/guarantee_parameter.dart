import 'package:json_annotation/json_annotation.dart';

part 'guarantee_parameter.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class GuaranteeParameter {
  String? txRifIdPolParametro;
  String? txParametro;
  String? txDatoVariabile;
  int? nProgressivoParametro;
  String? cdValoreParametro;
  String? txValoreParametro;

  GuaranteeParameter({
    this.txRifIdPolParametro,
    this.txParametro,
    this.txDatoVariabile,
    this.nProgressivoParametro,
    this.cdValoreParametro,
    this.txValoreParametro,
  });

  GuaranteeParameter copyWith({
    String? txRifIdPolParametro,
    String? txParametro,
    String? txDatoVariabile,
    int? nProgressivoParametro,
    String? cdValoreParametro,
    String? txValoreParametro,
  }) {
    return GuaranteeParameter(
      txRifIdPolParametro: txRifIdPolParametro ?? this.txRifIdPolParametro,
      txParametro: txParametro ?? this.txParametro,
      txDatoVariabile: txDatoVariabile ?? this.txDatoVariabile,
      nProgressivoParametro:
          nProgressivoParametro ?? this.nProgressivoParametro,
      cdValoreParametro: cdValoreParametro ?? this.cdValoreParametro,
      txValoreParametro: txValoreParametro ?? this.txValoreParametro,
    );
  }

  factory GuaranteeParameter.fromJson(Map<String, dynamic> json) =>
      _$GuaranteeParameterFromJson(json);

  Map<String, dynamic> toJson() => _$GuaranteeParameterToJson(this);
}
