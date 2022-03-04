// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_quiz_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelectedQuizProgress _$$_SelectedQuizProgressFromJson(
        Map<String, dynamic> json) =>
    _$_SelectedQuizProgress(
      quiz: json['quiz'] == null
          ? null
          : Quiz.fromJson(json['quiz'] as Map<String, dynamic>),
      currentChapterOrder: json['currentChapterOrder'] as int?,
    );

Map<String, dynamic> _$$_SelectedQuizProgressToJson(
        _$_SelectedQuizProgress instance) =>
    <String, dynamic>{
      'quiz': instance.quiz,
      'currentChapterOrder': instance.currentChapterOrder,
    };
