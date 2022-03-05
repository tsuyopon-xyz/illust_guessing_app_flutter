import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/models/selected_quiz_progress.dart';
import 'package:illust_guessing_app/src/models/quiz.dart';
import 'package:illust_guessing_app/src/loaders/json_loader.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final jsonLoader = JsonLoader();
  final String jsonString = await jsonLoader.loadQuizzes();
  var singleQuizJson = json.decode(jsonString)[0];

  test('Create SelectedQuizProgress without quiz data.', () {
    SelectedQuizProgress sqp = SelectedQuizProgress();

    expect(sqp.quiz, null);
    expect(sqp.currentChapterIndex, null);
    expect(sqp.hasNextChapter(), false);
  });

  test('Create SelectedQuizProgress with quiz data', () {
    Quiz quiz = Quiz.fromJson(singleQuizJson);
    int firstChapterIndex = 0;
    SelectedQuizProgress sqp = SelectedQuizProgress(
        quiz: quiz, currentChapterIndex: firstChapterIndex);

    expect(sqp.quiz?.id, quiz.id);
    expect(sqp.currentChapterIndex, firstChapterIndex);
    expect(sqp.hasNextChapter(), true);
  });

  test('Copy SelectedQuizProgress and update value', () {
    SelectedQuizProgress sqp = SelectedQuizProgress();

    expect(sqp.quiz, null);
    expect(sqp.currentChapterIndex, null);
    expect(sqp.hasNextChapter(), false);

    Quiz quiz = Quiz.fromJson(singleQuizJson);
    int lastChapterOrder = quiz.chapters.length - 1;

    SelectedQuizProgress copiedSqp =
        sqp.copyWith(quiz: quiz, currentChapterIndex: lastChapterOrder);

    expect(copiedSqp.quiz?.id, quiz.id);
    expect(copiedSqp.currentChapterIndex, lastChapterOrder);
    expect(copiedSqp.hasNextChapter(), false);
    expect(copiedSqp, isNot(equals(sqp)));
  });
}
