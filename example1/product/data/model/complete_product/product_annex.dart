import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_annex.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductAnnex extends Equatable {
  final String? txRifIdAllegato;
  final String? txNomeAllegato;
  final String? txNoteAllegato;
  final num? nPrgAllegato;
  final String? dtInserimento;

  ProductAnnex({
    this.txRifIdAllegato,
    this.txNomeAllegato,
    this.txNoteAllegato,
    this.nPrgAllegato,
    this.dtInserimento,
  });

  @override
  List<Object?> get props => [
        txRifIdAllegato,
        txNomeAllegato,
        txNoteAllegato,
        nPrgAllegato,
        dtInserimento,
      ];

  static ProductAnnex getDefault() => ProductAnnex();

  factory ProductAnnex.fromJson(Map<String, dynamic> json) =>
      _$ProductAnnexFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAnnexToJson(this);
}
