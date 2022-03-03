// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizChapter _$$_QuizChapterFromJson(Map<String, dynamic> json) =>
    _$_QuizChapter(
      order: json['order'] as int,
      question: json['question'] as String,
      hint: json['hint'] as String,
      comment: json['comment'] as String,
      correctArea:
          _CorrectArea.fromJson(json['correct_area'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QuizChapterToJson(_$_QuizChapter instance) =>
    <String, dynamic>{
      'order': instance.order,
      'question': instance.question,
      'hint': instance.hint,
      'comment': instance.comment,
      'correct_area': instance.correctArea,
    };

_$__CorrectArea _$$__CorrectAreaFromJson(Map<String, dynamic> json) =>
    _$__CorrectArea(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$$__CorrectAreaToJson(_$__CorrectArea instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
    };
