// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductModelFromScratchFromJson(Map json) =>
    ProductDto(
      idPolizza: json['idPolizza'] as int?,
      numeroProposta: json['numeroProposta'] as String?,
      numeroPolizza: json['numeroPolizza'] as String?,
      numeroPolizzaBase: json['numeroPolizzaBase'] as String?,
      dataEffetto: json['dataEffetto'] == null
          ? null
          : DateTime.parse(json['dataEffetto'] as String),
      dataScadenza: json['dataScadenza'] == null
          ? null
          : DateTime.parse(json['dataScadenza'] as String),
      cdReteVendita: json['cdReteVendita'] as String?,
      reteVendita: json['reteVendita'] as String?,
      cdProduttore: json['cdProduttore'] as String?,
      produttore: json['produttore'] as String?,
      cdLinea: json['cdLinea'] as String?,
      linea: json['linea'] as String?,
      descProdotto: json['descProdotto'] as String?,
      contraente: json['contraente'] as String?,
      codiceFiscalePIvaContraente:
          json['codiceFiscalePIvaContraente'] as String?,
      cdStatoPolizza: json['cdStatoPolizza'] as String?,
      statoPolizza: json['statoPolizza'] as String?,
      cdFrazionamento: json['cdFrazionamento'] as String?,
      frazionamento: json['frazionamento'] as String?,
      cdCompagnia: json['cdCompagnia'] as String?,
      txCompagnia: json['txCompagnia'] as String?,
      txTarga: json['txTarga'] as String?,
      txTelaio: json['txTelaio'] as String?,
      cdTipoPolizza: json['cdTipoPolizza'] as int?,
      cdTipologiaEmissione: json['cdTipologiaEmissione'] as String?,
    );

Map<String, dynamic> _$ProductModelFromScratchToJson(
        ProductDto instance) =>
    <String, dynamic>{
      'idPolizza': instance.idPolizza,
      'numeroProposta': instance.numeroProposta,
      'numeroPolizza': instance.numeroPolizza,
      'numeroPolizzaBase': instance.numeroPolizzaBase,
      'dataEffetto': instance.dataEffetto?.toIso8601String(),
      'dataScadenza': instance.dataScadenza?.toIso8601String(),
      'cdReteVendita': instance.cdReteVendita,
      'reteVendita': instance.reteVendita,
      'cdProduttore': instance.cdProduttore,
      'produttore': instance.produttore,
      'cdLinea': instance.cdLinea,
      'linea': instance.linea,
      'descProdotto': instance.descProdotto,
      'contraente': instance.contraente,
      'codiceFiscalePIvaContraente': instance.codiceFiscalePIvaContraente,
      'cdStatoPolizza': instance.cdStatoPolizza,
      'statoPolizza': instance.statoPolizza,
      'cdFrazionamento': instance.cdFrazionamento,
      'frazionamento': instance.frazionamento,
      'cdCompagnia': instance.cdCompagnia,
      'txCompagnia': instance.txCompagnia,
      'txTarga': instance.txTarga,
      'txTelaio': instance.txTelaio,
      'cdTipoPolizza': instance.cdTipoPolizza,
      'cdTipologiaEmissione': instance.cdTipologiaEmissione,
    };
