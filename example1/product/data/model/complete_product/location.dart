import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'location.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Location {
  String? txRifIdPolUbicazione;
  String? txNoteUbicazione;
  int? nAnnoCostruzione;
  String? cdTipoFabbricato;
  String? txTipoFabbricato;
  String? cdTipoRipartizione;
  String? txTipoRipartizione;
  String? cdAttivita;
  String? txAttivita;
  bool? bAbitazionePrincipale;
  double? nValoreImmobile;
  Address? indirizzo;

  Location({
    this.txRifIdPolUbicazione,
    this.txNoteUbicazione,
    this.nAnnoCostruzione,
    this.cdTipoFabbricato,
    this.txTipoFabbricato,
    this.cdTipoRipartizione,
    this.txTipoRipartizione,
    this.cdAttivita,
    this.txAttivita,
    this.bAbitazionePrincipale,
    this.nValoreImmobile,
    this.indirizzo,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
