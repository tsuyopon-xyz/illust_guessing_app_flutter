import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_status.freezed.dart';
part 'quiz_status.g.dart';

// Quizのクリア状況やプレイできる、ロック状況を表現するモデル

@freezed
class QuizStatus with _$QuizStatus {
  factory QuizStatus(
      {required int quizId,
      @Default(0) int completedChapterCount,
      @Default(false) bool isCompleted,
      @Default(true) bool isLocked}) = _QuizStatus;

  factory QuizStatus.fromJson(Map<String, dynamic> json) =>
      _$QuizStatusFromJson(json);
}
