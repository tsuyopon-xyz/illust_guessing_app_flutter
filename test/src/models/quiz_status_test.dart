import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/models/quiz_status.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Create quiz_status', () {
    QuizStatus quizStatus = QuizStatus(quizId: 1);
    expect(quizStatus.quizId, 1);
    expect(quizStatus.completedChapterCount, 0);
    expect(quizStatus.isCompleted, false);
    expect(quizStatus.isLocked, true);

    expect(quizStatus.toJson(), {
      'quizId': 1,
      'completedChapterCount': 0,
      'isCompleted': false,
      'isLocked': true
    });
  });
}
