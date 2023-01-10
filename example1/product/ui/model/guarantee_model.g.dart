// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guarantee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuaranteeModel _$GuaranceModelFromJson(Map json) => GuaranteeModel(
      deductible: json['deductible'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      maximal: json['maximal'] as int,
      price: (json['price'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      answer: (json['answer'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      assets: (json['assets'] as List<dynamic>)
          .map((e) => AssetModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      salesRoule: json['salesRoule'] as String,
      quoteFx: json['quoteFx'] as String,
    );

Map<String, dynamic> _$GuaranceModelToJson(GuaranteeModel instance) =>
    <String, dynamic>{
      'deductible': instance.deductible,
      'name': instance.name,
      'description': instance.description,
      'maximal': instance.maximal,
      'price': instance.price,
      'tax': instance.tax,
      'discount': instance.discount,
      'answer': instance.answer.map((e) => e.toJson()).toList(),
      'assets': instance.assets.map((e) => e.toJson()).toList(),
      'salesRoule': instance.salesRoule,
      'quoteFx': instance.quoteFx,
    };
