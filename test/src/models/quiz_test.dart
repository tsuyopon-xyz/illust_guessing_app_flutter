import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/models/quiz.dart';
import 'package:illust_guessing_app/src/loaders/json_loader.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final jsonLoader = JsonLoader();
  final String jsonString = await jsonLoader.loadQuizzes();

  test('Create single quiz from json', () {
    var data = json.decode(jsonString);
    var singleQuizJson = data[0];
    var chapters = singleQuizJson['chapters'];

    Quiz quiz = Quiz.fromJson(singleQuizJson);
    expect(singleQuizJson['id'], quiz.id);
    expect(quiz.chapters.length, 4);
    quiz.chapters.asMap().forEach((index, chapter) {
      var comparisonChapter = chapters[index];

      expect(chapter.order, comparisonChapter['order']);
      expect(chapter.hint, comparisonChapter['hint']);
      expect(chapter.comment, comparisonChapter['comment']);
      expect(chapter.correctArea.x, comparisonChapter['correct_area']['x']);
      expect(chapter.correctArea.y, comparisonChapter['correct_area']['y']);
      expect(chapter.correctArea.width,
          comparisonChapter['correct_area']['width']);
      expect(chapter.correctArea.height,
          comparisonChapter['correct_area']['height']);
    });
  });
}
