import 'dart:convert';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/providers/selected_quiz_progress_provider.dart'
    show selectedQuizProgressProvider;
import 'package:illust_guessing_app/src/models/quiz.dart';
import 'package:illust_guessing_app/src/models/selected_quiz_progress.dart';
import 'package:illust_guessing_app/src/loaders/json_loader.dart';

// mockito を使ってプロバイダによる Listener への通知を追跡する
class Listener extends Mock {
  void call(SelectedQuizProgress? previous, SelectedQuizProgress value);
}

// Providerテストの参考記事
// https://zuma-lab.com/posts/flutter-mockito-di-unit-test
// https://riverpod.dev/ja/docs/cookbooks/testing
void main() {
  late Quiz _quiz;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final jsonLoader = JsonLoader();
    final String jsonString = await jsonLoader.loadQuizzes();
    var data = json.decode(jsonString);
    var singleQuizJson = data[0];
    _quiz = Quiz.fromJson(singleQuizJson);
  });

  test('Check behavior of selectedQuizProgressProvider', () {
    final container = ProviderContainer();
    final listener = Listener();
    addTearDown(container.dispose);

    container.listen<SelectedQuizProgress>(
        selectedQuizProgressProvider, listener,
        fireImmediately: true);

    // 初期化時のstateの変化をテスト
    verify(listener(null, SelectedQuizProgress())).called(1);
    verifyNoMoreInteractions(listener);

    // selectQuizメソッド実行時のstateの変化をテスト
    var notifier = container.read(selectedQuizProgressProvider.notifier);
    notifier.selectQuiz(_quiz);

    verify(listener(SelectedQuizProgress(),
            SelectedQuizProgress(quiz: _quiz, currentChapterIndex: 0)))
        .called(1);
    verifyNoMoreInteractions(listener);

    // goToNextChapterメソッド実行時のstateの変化をテスト
    int lastIndex = _quiz.chapters.length - 1;
    _quiz.chapters.asMap().forEach((index, _) {
      bool hasNext = notifier.hasNextChapter();
      if (index < lastIndex) {
        expect(hasNext, true);
        notifier.goToNextChapter();
        verify(listener(
                SelectedQuizProgress(quiz: _quiz, currentChapterIndex: index),
                SelectedQuizProgress(
                    quiz: _quiz, currentChapterIndex: index + 1)))
            .called(1);
      } else {
        expect(hasNext, false);
        notifier.goToNextChapter();
        verifyNever(listener(
            SelectedQuizProgress(quiz: _quiz, currentChapterIndex: index),
            SelectedQuizProgress(quiz: _quiz, currentChapterIndex: index + 1)));
      }

      verifyNoMoreInteractions(listener);
    });

    // 最終的な値
    SelectedQuizProgress sqp = notifier.state;

    expect(sqp.currentChapterIndex, sqp.quiz!.chapters.length - 1);
    expect(sqp.hasNextChapter(), false);
  });
}
