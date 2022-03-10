import 'package:sqflite/sqflite.dart' show Database;
import 'package:illust_guessing_app/src/models/quiz_v2.dart';
import 'package:illust_guessing_app/src/constants/constants.dart'
    show CHAPTERS_TABLE_NAME, QUIZZES_TABLE_NAME;
import 'package:illust_guessing_app/src/models/chapter.dart' show Chapter;
import 'i_repository.dart' show IRepository;

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
  Future<Chapter?> find({required int id, bool includes = false}) async {
    var records = await db.query(CHAPTERS_TABLE_NAME,
        where: "id=?", whereArgs: [id], limit: 1);

    if (records.isEmpty) {
      return null;
    }

    if (includes) {
      var chapterRecord = records[0];
      var quizId = chapterRecord['quiz_id'];
      var quizRecords = await db
          .query(QUIZZES_TABLE_NAME, where: 'id=?', whereArgs: [quizId]);

      var quiz = QuizV2.fromJson(quizRecords[0]);
      var chapter = Chapter.fromJson(chapterRecord);

      return chapter.copyWith(quiz: quiz);
    } else {
      return Chapter.fromJson(records[0]);
    }
  }

  @override
  Future<List<Chapter>> findAll({bool includes = false}) async {
    if (includes) {
      var chapterRecords = await db.query(CHAPTERS_TABLE_NAME);
      var quizIds =
          chapterRecords.map((record) => record['quiz_id']).toSet().toList();
      var quizRecords = await db.query(QUIZZES_TABLE_NAME,
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
      var records = await db.query(CHAPTERS_TABLE_NAME);
      return records.map((record) => Chapter.fromJson(record)).toList();
    }
  }

  @override
  Future<List<Chapter>> findWhere(
      {required String where, bool includes = false}) async {
    if (includes) {
      var chapterRecords = await db.query(CHAPTERS_TABLE_NAME, where: where);
      var quizIds =
          chapterRecords.map((record) => record['quiz_id']).toSet().toList();
      var quizRecords = await db.query(QUIZZES_TABLE_NAME,
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
      var records = await db.query(CHAPTERS_TABLE_NAME, where: where);

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
