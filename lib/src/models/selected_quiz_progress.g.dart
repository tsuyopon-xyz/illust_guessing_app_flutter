// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_quiz_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelectedQuizProgress _$$_SelectedQuizProgressFromJson(
        Map<String, dynamic> json) =>
    _$_SelectedQuizProgress(
      quiz: Quiz.fromJson(json['quiz'] as Map<String, dynamic>),
      currentChapterOrder: json['currentChapterOrder'] as int? ?? 1,
      hasNextChapter: json['hasNextChapter'] as bool? ?? true,
    );

Map<String, dynamic> _$$_SelectedQuizProgressToJson(
        _$_SelectedQuizProgress instance) =>
    <String, dynamic>{
      'quiz': instance.quiz,
      'currentChapterOrder': instance.currentChapterOrder,
      'hasNextChapter': instance.hasNextChapter,
    };
