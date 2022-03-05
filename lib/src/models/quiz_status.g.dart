// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizStatus _$$_QuizStatusFromJson(Map<String, dynamic> json) =>
    _$_QuizStatus(
      quizId: json['quizId'] as int,
      completedChapterCount: json['completedChapterCount'] as int? ?? 0,
      isCompleted: json['isCompleted'] as bool? ?? false,
      isLocked: json['isLocked'] as bool? ?? true,
    );

Map<String, dynamic> _$$_QuizStatusToJson(_$_QuizStatus instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'completedChapterCount': instance.completedChapterCount,
      'isCompleted': instance.isCompleted,
      'isLocked': instance.isLocked,
    };
