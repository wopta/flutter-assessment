import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'answer_model.dart';
import 'asset_model.dart';

part 'guarantee_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class GuaranteeModel extends Equatable {
  late String deductible;
  late String name;
  late String description;
  late int maximal;
  late double price;
  late double tax;
  late double discount;
  late List<AnswerModel> answer;
  late List<AssetModel> assets;
  late String salesRoule;
  late String quoteFx;

  GuaranteeModel({
    required this.deductible,
    required this.name,
    required this.description,
    required this.maximal,
    required this.price,
    required this.tax,
    required this.discount,
    required this.answer,
    required this.assets,
    required this.salesRoule,
    required this.quoteFx,
  });
  static GuaranteeModel getDefault() => GuaranteeModel(
      answer: [],
      assets: [],
      deductible: '',
      discount: 0.0,
      maximal: 0,
      name: '',
      quoteFx: '',
      salesRoule: '',
      price: 0.0,
      tax: 0.0,
      description: '');

  @override
  // TODO: implement props
  List<Object?> get props => [];

  factory GuaranteeModel.fromJson(Map<String, dynamic> json) =>
      _$GuaranceModelFromJson(json);
  Map<String, dynamic> toJson() => _$GuaranceModelToJson(this);
}
