import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/quiz.dart';
import '../models/selected_quiz_progress.dart';

class _SelectedQuizProgressNotifier
    extends StateNotifier<SelectedQuizProgress> {
  _SelectedQuizProgressNotifier() : super(SelectedQuizProgress());

  // Todo の追加
  void selectQuiz(Quiz quiz) {
    int startChapterIndex = 0;
    state = SelectedQuizProgress(
        quiz: quiz, currentChapterIndex: startChapterIndex);
  }

  bool hasNextChapter() {
    return state.hasNextChapter();
  }

  void goToNextChapter() {
    if (!state.hasNextChapter()) {
      return;
    }

    int oldChapterIndex = state.currentChapterIndex!;
    int newChapterIndex = oldChapterIndex + 1;
    state = state.copyWith(currentChapterIndex: newChapterIndex);
  }
}

// 最後に TodosNotifier のインスタンスを値に持つ StateNotifierProvider を作成し、
// UI 側から Todo リストを操作することを可能にします。
final selectedQuizProgressProvider = StateNotifierProvider.autoDispose<
    _SelectedQuizProgressNotifier, SelectedQuizProgress>((_) {
  return _SelectedQuizProgressNotifier();
});
