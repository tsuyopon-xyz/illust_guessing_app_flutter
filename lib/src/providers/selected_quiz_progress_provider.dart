import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/quiz.dart';
import '../models/selected_quiz_progress.dart';

class _SelectedQuizProgressNotifier
    extends StateNotifier<SelectedQuizProgress> {
  // Todo リストを空のリストとして初期化します。
  _SelectedQuizProgressNotifier() : super(SelectedQuizProgress());

  // Todo の追加
  void selectQuiz(Quiz quiz) {
    // ステート自体もイミュータブルなため、`state.add(todo)`
    // のような操作はできません。
    // 代わりに、既存 Todo と新規 Todo を含む新しいリストを作成します。
    // Dart のスプレッド演算子を使うと便利ですよ!
    int firstChapterOrder = quiz.chapters.first.order;
    state = SelectedQuizProgress(
        quiz: quiz, currentChapterOrder: firstChapterOrder);
    // `notifyListeners` などのメソッドを呼ぶ必要はありません。
    // `state =` により必要なときに UI側 に通知が届き、ウィジェットが更新されます。
  }
}

// 最後に TodosNotifier のインスタンスを値に持つ StateNotifierProvider を作成し、
// UI 側から Todo リストを操作することを可能にします。
final selectedQuizProgressProvider =
    StateNotifierProvider<_SelectedQuizProgressNotifier, SelectedQuizProgress>(
        (ref) {
  return _SelectedQuizProgressNotifier();
});
