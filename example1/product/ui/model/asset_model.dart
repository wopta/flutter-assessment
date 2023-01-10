import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AssetModel extends Equatable {
  late double value;
  late double percent;
  late String type;
  late dynamic ref;

  AssetModel({
    required this.value,
    required this.percent,
    required this.type,
    required this.ref,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);
  Map<String, dynamic> toJson() => _$AssetModelToJson(this);
}
