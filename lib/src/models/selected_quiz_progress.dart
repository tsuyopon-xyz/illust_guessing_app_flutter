import 'package:freezed_annotation/freezed_annotation.dart';
import 'quiz.dart';

part 'selected_quiz_progress.freezed.dart';
part 'selected_quiz_progress.g.dart';

@freezed
class SelectedQuizProgress with _$SelectedQuizProgress {
  const SelectedQuizProgress._();
  factory SelectedQuizProgress({Quiz? quiz, int? currentChapterIndex}) =
      _SelectedQuizProgress;

  factory SelectedQuizProgress.fromJson(Map<String, dynamic> json) =>
      _$SelectedQuizProgressFromJson(json);

  bool hasNextChapter() {
    if (quiz == null) return false;
    if (currentChapterIndex == null) return false;

    return currentChapterIndex! < quiz!.chapters.length - 1;
  }
}