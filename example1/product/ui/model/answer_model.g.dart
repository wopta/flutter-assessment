// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map json) => AnswerModel(
      answer: json['answer'] as String? ?? '',
      question: json['question'] as String? ?? '',
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'question': instance.question,
    };
