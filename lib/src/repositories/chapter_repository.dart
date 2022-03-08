import 'package:sqflite/sqflite.dart' show Database;
import 'i_repository.dart' show IRepository;
import '../models/chapter.dart' show Chapter;
import 'package:illust_guessing_app/src/models/quiz_v2.dart';
import 'constants_table_names.dart' show chaptersTableName, quizzesTableName;

class ChapterRepository implements IRepository<Chapter> {
  final Database db;

  ChapterRepository({required this.db});

  @override
  Future<bool> delete(Chapter data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Chapter> find({required int id, bool includes = false}) {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<List<Chapter>> findAll({bool includes = false}) async {
    if (includes) {
      var chapterRecords = await db.query(chaptersTableName);
      var quizIds =
          chapterRecords.map((record) => record['quiz_id']).toSet().toList();
      var quizRecords = await db.query(quizzesTableName,
          where: 'id IN (${List.filled(quizIds.length, '?').join(',')})',
          whereArgs: quizIds);

      var chapters = chapterRecords.map((record) {
        var chapter = Chapter.fromJson(record);
        var quizRecord =
            quizRecords.firstWhere((record) => record['id'] == chapter.quizId);
        var quiz = QuizV2.fromJson(quizRecord);

        return chapter.copyWith(quiz: quiz);
      }).toList();

      return chapters;
    } else {
      var records = await db.query(chaptersTableName);
      return records.map((record) => Chapter.fromJson(record)).toList();
    }
  }

  @override
  Future<List<Chapter>> findWhere(
      {required String where, bool includes = false}) async {
    if (includes) {
      var chapterRecords = await db.query(chaptersTableName, where: where);
      var quizIds =
          chapterRecords.map((record) => record['quiz_id']).toSet().toList();
      var quizRecords = await db.query(quizzesTableName,
          where: 'id IN (${List.filled(quizIds.length, '?').join(',')})',
          whereArgs: quizIds);

      var chapters = chapterRecords.map((record) {
        var chapter = Chapter.fromJson(record);
        var quizRecord =
            quizRecords.firstWhere((record) => record['id'] == chapter.quizId);
        var quiz = QuizV2.fromJson(quizRecord);

        return chapter.copyWith(quiz: quiz);
      }).toList();

      return chapters;
    } else {
      var records = await db.query(chaptersTableName, where: where);

      return records.map((record) => Chapter.fromJson(record)).toList();
    }
  }

  @override
  Future<bool> save(Chapter data) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAll(List<Chapter> dataList) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }
}
