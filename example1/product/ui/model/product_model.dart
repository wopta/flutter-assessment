import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wopta/product/ui/model/component_form_model.dart';
import 'package:wopta/product/ui/model/guarantee_model.dart';

part 'product_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductModel extends Equatable {
  late String name;
  late String description;
  late double price;
  late String salesRoule;
  late String quoteFx;
  late List<String> deductible;
  late List<String> maximal;
  late List<ComponentFormModel> variablesShema;
  late List<GuaranteeModel> guarantees;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.salesRoule,
    required this.quoteFx,
    required this.deductible,
    required this.maximal,
    required this.guarantees,
  });
  static ProductModel getDefault() => ProductModel(
      deductible: const ['', ''],
      description: '',
      guarantees: [GuaranteeModel.getDefault()],
      maximal: const ['', ''],
      name: '',
      price: 0.0,
      quoteFx: '',
      salesRoule: '');

  // static ProductModel getDefault() => ProductModel(
  //     price: 0.0,
  //     name: '',
  //     deductible: const [],
  //     description: '',
  //     guarantees: const [],
  //     maximal: const [],
  //     quoteFx: '',
  //     salesRoule: '');

  @override
  List<Object?> get props => [name, description, price, guarantees];

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
