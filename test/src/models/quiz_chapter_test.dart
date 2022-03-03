import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/models/quiz_chapter.dart';
import 'package:illust_guessing_app/src/loaders/json_loader.dart';

Future<void> main() async {
  final jsonLoader = JsonLoader();
  final String jsonString = await jsonLoader.loadQuizzes();

  test('Succeeded loading json file', () async {
    var data = json.decode(jsonString);
    var chapter = data[0]['chapters'][0];

    QuizChapter qc = QuizChapter.fromJson(chapter);
    expect(chapter['order'], equals(qc.order));
    expect(chapter['question'], equals(qc.question));
    expect(chapter['hint'], equals(qc.hint));
    expect(chapter['comment'], equals(qc.comment));
    expect(chapter['correct_area']['x'], equals(qc.correctArea.x));
    expect(chapter['correct_area']['y'], equals(qc.correctArea.y));
    expect(chapter['correct_area']['width'], equals(qc.correctArea.width));
    expect(chapter['correct_area']['height'], equals(qc.correctArea.height));
  });
}
