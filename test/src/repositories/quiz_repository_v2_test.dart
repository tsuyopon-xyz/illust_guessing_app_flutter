import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart' show Database;
import 'package:illust_guessing_app/src/db/database_client.dart'
    show DatabaseClient;
import 'package:illust_guessing_app/src/repositories/quiz_repository_v2.dart';

Future<void> main() async {
  late Database db;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    db = await DatabaseClient.instance.database;
  });

  tearDownAll(() async {
    await db.close();
  });

  group('findAll', () {
    test(
        'When includes is false, QuizRepository#findAll returns List<QuizV2> without chapters.',
        () async {
      final repository = QuizRepositoryV2(db: db);
      var quizList = await repository.findAll();

      expect(quizList.isNotEmpty, true);
      expect(quizList[0].id, 1);
      expect(quizList[0].title.isNotEmpty, true);
      expect(quizList[0].chapters, null);
    });

    test(
        'When includes is true, QuizRepository#findAll returns List<QuizV2> with chapters.',
        () async {
      final repository = QuizRepositoryV2(db: db);
      var quizList = await repository.findAll(includes: true);

      expect(quizList.isNotEmpty, true);
      expect(quizList[0].id, 1);
      expect(quizList[0].title.isNotEmpty, true);
      expect(quizList[0].chapters!.isNotEmpty, true);
      quizList.forEach((quiz) {
        quiz.chapters!.forEach((chapter) {
          expect(chapter.id! > 0, true);
          expect(chapter.quizId, quiz.id);
        });
      });
    });
  });

  group('find', () {
    test('When id is not found, QuizRepository#find returns null.', () async {
      final repository = QuizRepositoryV2(db: db);
      const targetChapterId = -1;
      var quiz = await repository.find(id: targetChapterId);

      expect(quiz, null);
    });

    test(
        'When includes is false, QuizRepository#find returns QuizV2 without chapters.',
        () async {
      final repository = QuizRepositoryV2(db: db);
      const targetQuizId = 1;
      var quiz = await repository.find(id: targetQuizId);

      expect(quiz?.id, targetQuizId);
      expect(quiz?.title.isNotEmpty, true);
      expect(quiz?.chapters, isNull);
    });

    test(
        'When includes is true, QuizRepository#find returns QuizV2 with chapters.',
        () async {
      final repository = QuizRepositoryV2(db: db);
      const targetQuizId = 1;
      var quiz = await repository.find(id: targetQuizId, includes: true);

      expect(quiz?.id, targetQuizId);
      expect(quiz?.title.isNotEmpty, true);
      expect(quiz?.chapters!.isNotEmpty, true);
      quiz!.chapters!.forEach((chapter) {
        expect(chapter.id! > 0, true);
        expect(chapter.quizId, quiz.id);
      });
    });
  });
}
