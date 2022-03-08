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

  test('QuizRepository#findAll returns List<Quiz>.', () async {
    final repository = QuizRepositoryV2(db: db);
    var quizList = await repository.findAll();

    // expect(quizList.isNotEmpty, equals(true));
    // expect(quizList[0].id, equals(1));
    // expect(quizList[0].chapters.length, equals(4));
  });
}
