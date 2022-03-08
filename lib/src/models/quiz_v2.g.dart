// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizV2 _$$_QuizV2FromJson(Map<String, dynamic> json) => _$_QuizV2(
      id: json['id'] as int,
      title: json['title'] as String,
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuizV2ToJson(_$_QuizV2 instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'chapters': instance.chapters,
    };
