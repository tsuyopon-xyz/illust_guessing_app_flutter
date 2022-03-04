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

  test('Create SelectedQuizProgress', () {
    Quiz quiz = Quiz.fromJson(singleQuizJson);
    SelectedQuizProgress sqp = SelectedQuizProgress(quiz: quiz);

    expect(sqp.quiz.id, quiz.id);
    expect(sqp.currentChapterOrder, 1, reason: 'Default is 1');
    expect(sqp.hasNextChapter, true, reason: 'Default is true');
  });

  test('Copy SelectedQuizProgress and update default values', () {
    Quiz quiz = Quiz.fromJson(singleQuizJson);
    SelectedQuizProgress sqp = SelectedQuizProgress(quiz: quiz);

    int lastChapterOrder = quiz.chapters.last.order;
    bool hasNextChapter = false;

    SelectedQuizProgress copiedSqp = sqp.copyWith(
        currentChapterOrder: quiz.chapters.length,
        hasNextChapter: hasNextChapter);

    expect(copiedSqp.quiz.id, quiz.id);
    expect(copiedSqp.currentChapterOrder, lastChapterOrder);
    expect(copiedSqp.hasNextChapter, hasNextChapter);
    expect(copiedSqp, isNot(equals(sqp)));
  });
}
