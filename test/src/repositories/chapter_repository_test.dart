import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart' show Database;
import 'package:illust_guessing_app/src/db/database_client.dart'
    show DatabaseClient;
import 'package:illust_guessing_app/src/repositories/chapter_repository.dart'
    show ChapterRepository;

Future<void> main() async {
  late Database db;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    db = await DatabaseClient.instance.database;
  });

  tearDownAll(() async {
    await db.close();
  });

  group('The findAll method', () {
    test('ChapterRepository#findAll without includes returns List<Chapter>.',
        () async {
      final repository = ChapterRepository(db: db);
      var chapterList = await repository.findAll();

      expect(chapterList.isNotEmpty, true);
      chapterList.asMap().forEach((index, chapter) {
        final int expectedId = index + 1;
        expect(chapter.id, expectedId);
        expect(chapter.quiz, null);
      });
    });

    test('ChapterRepository#findAll with includes returns List<Chapter>.',
        () async {
      final repository = ChapterRepository(db: db);
      var chapterList = await repository.findAll(includes: true);

      expect(chapterList.isNotEmpty, true);
      chapterList.asMap().forEach((index, chapter) {
        final int expectedId = index + 1;
        expect(chapter.id, expectedId);
        expect(chapter.quiz, isNotNull);
        expect(chapter.quizId, chapter.quiz?.id);
      });
    });
  });

  group('The findWhere method', () {
    test('ChapterRepository#findWhere without includes returns List<Chapter>.',
        () async {
      final repository = ChapterRepository(db: db);
      const targetQuizId = 1;
      var chapterList =
          await repository.findWhere(where: 'quiz_id = $targetQuizId');

      expect(chapterList.isNotEmpty, true);
      chapterList.asMap().forEach((index, chapter) {
        expect(chapter.quizId, targetQuizId);
        expect(chapter.quiz, null);
      });
    });

    test('ChapterRepository#findWhere with includes returns List<Chapter>.',
        () async {
      final repository = ChapterRepository(db: db);
      const targetQuizId = 1;
      var chapterList = await repository.findWhere(
          where: 'quiz_id = $targetQuizId', includes: true);

      expect(chapterList.isNotEmpty, true);
      chapterList.asMap().forEach((index, chapter) {
        expect(chapter.quizId, targetQuizId);
        expect(chapter.quiz, isNotNull);
        expect(chapter.quiz?.id, targetQuizId);
      });
    });
  });
}
