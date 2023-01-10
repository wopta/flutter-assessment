// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guarantee_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuaranteeParameter _$GuaranteeParameterFromJson(Map json) => GuaranteeParameter(
      txRifIdPolParametro: json['txRifIdPolParametro'] as String?,
      txParametro: json['txParametro'] as String?,
      txDatoVariabile: json['txDatoVariabile'] as String?,
      nProgressivoParametro: json['nProgressivoParametro'] as int?,
      cdValoreParametro: json['cdValoreParametro'] as String?,
      txValoreParametro: json['txValoreParametro'] as String?,
    );

Map<String, dynamic> _$GuaranteeParameterToJson(GuaranteeParameter instance) =>
    <String, dynamic>{
      'txRifIdPolParametro': instance.txRifIdPolParametro,
      'txParametro': instance.txParametro,
      'txDatoVariabile': instance.txDatoVariabile,
      'nProgressivoParametro': instance.nProgressivoParametro,
      'cdValoreParametro': instance.cdValoreParametro,
      'txValoreParametro': instance.txValoreParametro,
    };
