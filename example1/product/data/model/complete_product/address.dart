import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Address {
  String? txRifIdIndirizzo;
  String? cdTipoIndirizzo;
  String? txTipoIndirizzo;
  String? txCap;
  String? txDescIndirizzo;
  String? txLocalita;
  String? cdComuneMinisteriale;
  String? txComune;
  String? txSiglaProvincia;
  String? cdNazioneUic;
  String? cdNazioneIso;
  String? txNazioneUic;
  bool? bPrincipale;
  String? cdPrefissoToponomastico;
  String? txPrefissoToponomastico;
  String? txToponimo;
  String? txCivico;
  double? nLatitudine;
  double? nLongitudine;
  bool? bGeolocalizzato;
  bool? bIndirizzoNonCensito;

  Address({
    this.txRifIdIndirizzo,
    this.cdTipoIndirizzo,
    this.txTipoIndirizzo,
    this.txCap,
    this.txDescIndirizzo,
    this.txLocalita,
    this.cdComuneMinisteriale,
    this.txComune,
    this.txSiglaProvincia,
    this.cdNazioneUic,
    this.cdNazioneIso,
    this.txNazioneUic,
    this.bPrincipale,
    this.cdPrefissoToponomastico,
    this.txPrefissoToponomastico,
    this.txToponimo,
    this.txCivico,
    this.nLatitudine,
    this.nLongitudine,
    this.bGeolocalizzato,
    this.bIndirizzoNonCensito,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
