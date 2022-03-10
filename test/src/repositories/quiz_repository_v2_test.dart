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
}
