// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map json) => ProductModel(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      salesRoule: json['salesRoule'] as String,
      quoteFx: json['quoteFx'] as String,
      deductible: (json['deductible'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      maximal:
          (json['maximal'] as List<dynamic>).map((e) => e as String).toList(),
      guarantees: (json['guarantees'] as List<dynamic>)
          .map((e) =>
              GuaranteeModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    )..variablesShema = (json['variablesShema'] as List<dynamic>)
        .map((e) =>
            ComponentFormModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'salesRoule': instance.salesRoule,
      'quoteFx': instance.quoteFx,
      'deductible': instance.deductible,
      'maximal': instance.maximal,
      'variablesShema': instance.variablesShema.map((e) => e.toJson()).toList(),
      'guarantees': instance.guarantees.map((e) => e.toJson()).toList(),
    };
