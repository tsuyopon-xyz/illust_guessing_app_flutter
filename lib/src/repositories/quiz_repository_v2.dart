import 'dart:convert';
import 'package:illust_guessing_app/src/models/quiz.dart';
import 'package:sqflite/sqflite.dart' show Database;

import 'i_repository.dart' show IRepository;
import '../loaders/json_loader.dart';
import '../models/quiz.dart';

class QuizRepositoryV2 implements IRepository<Quiz> {
  final Database db;
  static const String tableName = 'quizzes';
  static const String joinTableName = 'chapters';

  QuizRepositoryV2({required this.db});

  @override
  Future<bool> delete(Quiz data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Quiz> find() {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<List<Quiz>> findAll() async {
    var records = await db.rawQuery('''
SELECT
  *
FROM
  $tableName AS q
INNER JOIN
  $joinTableName AS c
ON
  q.id = c.quiz_id;
''');

    print("@@@@@@0 : $records");

    return [];
  }

  @override
  Future<bool> save(Quiz data) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAll(List<Quiz> dataList) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }
}
