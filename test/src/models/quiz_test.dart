import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/models/quiz.dart';
import 'package:illust_guessing_app/src/loaders/json_loader.dart';

Future<void> main() async {
  final jsonLoader = JsonLoader();
  final String jsonString = await jsonLoader.loadQuizzes();

  test('Create Quiz from json', () async {
    var data = json.decode(jsonString);
    var singleQuizJson = data[0];

    Quiz quiz = Quiz.fromJson(singleQuizJson);
    expect(singleQuizJson['id'], equals(quiz.id));
    expect(quiz.chapters.length, equals(4));
    quiz.chapters.asMap().forEach((index, chapter) {
      int expectedOrder = index + 1;
      expect(chapter.order, equals(expectedOrder));
    });
  });
}
