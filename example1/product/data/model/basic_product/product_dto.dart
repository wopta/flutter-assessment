import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductDto extends Equatable {
  late int? idPolizza;
  late String? numeroProposta;
  late String? numeroPolizza;
  late String? numeroPolizzaBase;
  late DateTime? dataEffetto;
  late DateTime? dataScadenza;
  late String? cdReteVendita;
  late String? reteVendita;
  late String? cdProduttore;
  late String? produttore;
  late String? cdLinea;
  late String? linea;
  late String? descProdotto;
  late String? contraente;
  late String? codiceFiscalePIvaContraente;
  late String? cdStatoPolizza;
  late String? statoPolizza;
  late String? cdFrazionamento;
  late String? frazionamento;
  late String? cdCompagnia;
  late String? txCompagnia;
  late String? txTarga;
  late String? txTelaio;
  late int? cdTipoPolizza;
  late String? cdTipologiaEmissione;

  ProductDto({
    this.idPolizza,
    this.numeroProposta,
    this.numeroPolizza,
    this.numeroPolizzaBase,
    this.dataEffetto,
    this.dataScadenza,
    this.cdReteVendita,
    this.reteVendita,
    this.cdProduttore,
    this.produttore,
    this.cdLinea,
    this.linea,
    this.descProdotto,
    this.contraente,
    this.codiceFiscalePIvaContraente,
    this.cdStatoPolizza,
    this.statoPolizza,
    this.cdFrazionamento,
    this.frazionamento,
    this.cdCompagnia,
    this.txCompagnia,
    this.txTarga,
    this.txTelaio,
    this.cdTipoPolizza,
    this.cdTipologiaEmissione,
  });

  @override
  List<Object?> get props => [
        idPolizza,
        numeroProposta,
        numeroPolizza,
        numeroPolizzaBase,
        dataEffetto,
        dataScadenza,
        cdReteVendita,
        reteVendita,
        cdProduttore,
        produttore,
        cdLinea,
        linea,
        descProdotto,
        contraente,
        codiceFiscalePIvaContraente,
        numeroPolizzaBase,
        cdStatoPolizza,
        statoPolizza,
        cdFrazionamento,
        frazionamento,
        cdCompagnia,
        txCompagnia,
        txTarga,
        txTelaio,
        cdTipoPolizza,
        cdTipologiaEmissione,
      ];

  static ProductDto getDefault() => ProductDto();

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromScratchFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelFromScratchToJson(this);
}

extension ProductModelFromScratchExtension on ProductDto {
  bool isBusinessInsurance() => descProdotto!
      .toLowerCase()
      .replaceAll(RegExp(r'[._]'), '')
      .contains('wopta per te artigiani e imprese');
  bool isPersonalInsurance() => descProdotto!
      .toLowerCase()
      .replaceAll(RegExp(r'[._]'), '')
      .contains('wopta per te persone');
}
