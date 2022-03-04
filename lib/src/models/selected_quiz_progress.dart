import 'package:freezed_annotation/freezed_annotation.dart';
import 'quiz.dart';

part 'selected_quiz_progress.freezed.dart';
part 'selected_quiz_progress.g.dart';

@freezed
class SelectedQuizProgress with _$SelectedQuizProgress {
  factory SelectedQuizProgress(
      {required Quiz quiz,
      @Default(1) int currentChapterOrder,
      @Default(true) bool hasNextChapter}) = _SelectedQuizProgress;

  factory SelectedQuizProgress.fromJson(Map<String, dynamic> json) =>
      _$SelectedQuizProgressFromJson(json);
}
