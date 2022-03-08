// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chapter _$$_ChapterFromJson(Map<String, dynamic> json) => _$_Chapter(
      id: json['id'] as int?,
      quizId: json['quiz_id'] as int,
      sortOrder: json['sort_order'] as int,
      hint: json['hint'] as String,
      comment: json['comment'] as String,
      correctAreaX: json['correct_area_x'] as int,
      correctAreaY: json['correct_area_y'] as int,
      correctAreaWidth: json['correct_area_width'] as int,
      correctAreaHeight: json['correct_area_height'] as int,
      quiz: json['quiz'] == null
          ? null
          : QuizV2.fromJson(json['quiz'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChapterToJson(_$_Chapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quiz_id': instance.quizId,
      'sort_order': instance.sortOrder,
      'hint': instance.hint,
      'comment': instance.comment,
      'correct_area_x': instance.correctAreaX,
      'correct_area_y': instance.correctAreaY,
      'correct_area_width': instance.correctAreaWidth,
      'correct_area_height': instance.correctAreaHeight,
      'quiz': instance.quiz,
    };
