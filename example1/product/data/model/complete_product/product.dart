import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wopta/product/data/model/complete_product/product_annex.dart';

import '../basic_product/asset_dto.dart';
import 'contract.dart';

part 'product.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Product extends Equatable {
  @JsonKey(name: 'elencoAllegati')
  final List<ProductAnnex>? attachments;
  @JsonKey(name: 'elencoBeni')
  final List<AssetDto>? assets;
  @JsonKey(name: 'dtScadenza')
  final DateTime expiryDate;
  @JsonKey(name: 'txNPolizza')
  final String policyNumber;
  @JsonKey(name: 'idPolizza')
  final int policyId;
  @JsonKey(name: 'contratto')
  final Contract contract;
  @JsonKey(name: 'cdProdotto')
  final String productTypeCode;

  bool isBusinessInsurance() => productTypeCode == 'PMIW';
  bool isPersonalInsurance() => productTypeCode == 'WPIN';

  Product(
      {this.attachments,
      this.assets,
      required this.expiryDate,
      required this.policyNumber,
      required this.policyId,
      required this.contract,
      required this.productTypeCode});

  @override
  List<Object?> get props => [
        attachments,
        assets,
        expiryDate,
        policyNumber,
        policyId,
        contract,
        productTypeCode
      ];

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
