// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_annex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAnnex _$ProductAnnexFromJson(Map json) => ProductAnnex(
      txRifIdAllegato: json['txRifIdAllegato'] as String?,
      txNomeAllegato: json['txNomeAllegato'] as String?,
      txNoteAllegato: json['txNoteAllegato'] as String?,
      nPrgAllegato: json['nPrgAllegato'] as num?,
      dtInserimento: json['dtInserimento'] as String?,
    );

Map<String, dynamic> _$ProductAnnexToJson(ProductAnnex instance) =>
    <String, dynamic>{
      'txRifIdAllegato': instance.txRifIdAllegato,
      'txNomeAllegato': instance.txNomeAllegato,
      'txNoteAllegato': instance.txNoteAllegato,
      'nPrgAllegato': instance.nPrgAllegato,
      'dtInserimento': instance.dtInserimento,
    };
