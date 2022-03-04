import 'dart:convert';
import 'package:illust_guessing_app/src/models/quiz.dart';

import '../loaders/json_loader.dart';
import '../models/quiz.dart';

class QuizRepository {
  Future<List<Quiz>> fetchQuizList() async {
    final jsonLoader = JsonLoader();
    var jsonString = await jsonLoader.loadQuizzes();
    var decodedJson = json.decode(jsonString) as List<dynamic>;

    return decodedJson.map((q) => Quiz.fromJson(q)).toList();
  }
}
