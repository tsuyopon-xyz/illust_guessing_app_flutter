import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/repositories/quiz_repository.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('QuizRepository#fetchQuizList returns List<Quiz>.', () async {
    final repository = QuizRepository();
    var quizList = await repository.fetchQuizList();

    expect(quizList.isNotEmpty, equals(true));
    expect(quizList[0].id, equals(1));
    expect(quizList[0].chapters.length, equals(4));
  });
}
