import 'package:riverpod/riverpod.dart';
import '../models/quiz.dart';
import '../repositories/quiz_repository.dart';

final quizListProvider = FutureProvider<List<Quiz>>((ref) async {
  final repository = QuizRepository();
  final quizList = await repository.fetchQuizList();

  return quizList;
});
