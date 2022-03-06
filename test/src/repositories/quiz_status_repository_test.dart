import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/repositories/quiz_status_repository.dart'
    show QuizStatusRepository;
import 'package:illust_guessing_app/src/utils/quiz_status_list_manager.dart'
    show QuizStatusListManager;
import 'package:illust_guessing_app/src/models/quiz_status.dart'
    show QuizStatus;

class MockQuizStatusListManager extends Mock implements QuizStatusListManager {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('QuizStatusRepository#findAll returns List<QuizStatus>.', () async {
    final mock = MockQuizStatusListManager();
    final repository = QuizStatusRepository(mock);
    final mockValues = [
      QuizStatus(quizId: 1),
      QuizStatus(quizId: 2),
      QuizStatus(quizId: 3),
    ];

    when(mock.load()).thenAnswer((_) => Future.value(mockValues));

    var result = await repository.findAll();
    expect(result, mockValues);
    verify(mock.load()).called(1);
  });

  test('QuizStatusRepository#saveAll returns List<QuizStatus>.', () async {
    final mock = MockQuizStatusListManager();
    final repository = QuizStatusRepository(mock);
    final mockValues = [
      QuizStatus(quizId: 1),
      QuizStatus(quizId: 2),
      QuizStatus(quizId: 3),
    ];

    when(mock.save(mockValues)).thenAnswer((_) => Future.value(true));

    var result = await repository.saveAll(mockValues);
    expect(result, true);
    verify(mock.save(mockValues)).called(1);
  });

  test('QuizStatusRepository#deleteAll returns List<QuizStatus>.', () async {
    final mock = MockQuizStatusListManager();
    final repository = QuizStatusRepository(mock);

    when(mock.delete()).thenAnswer((_) => Future.value(true));

    var result = await repository.deleteAll();
    expect(result, true);
    verify(mock.delete()).called(1);
  });
}
