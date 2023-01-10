import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AnswerModel extends Equatable {
  late final String answer;
  late final String question;

  AnswerModel({this.answer = '', this.question = ''});

  @override
  List<Object?> get props => [];

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
