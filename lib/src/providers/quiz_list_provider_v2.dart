import 'package:riverpod/riverpod.dart';
import '../models/quiz_v2.dart' show QuizV2;
import '../repositories/quiz_repository_v2.dart' show QuizRepositoryV2;
import '../db/database_client.dart' show DatabaseClient;

final quizListProviderV2 = FutureProvider<List<QuizV2>>((ref) async {
  final db = await DatabaseClient.instance.database;
  final repository = QuizRepositoryV2(db: db);
  final quizList = await repository.findAll(includes: true);

  return quizList;
});
