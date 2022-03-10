import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:illust_guessing_app/src/models/chapter.dart';
import 'package:illust_guessing_app/src/models/quiz.dart';
import 'package:sqflite/sqflite.dart' show Database;

import 'i_repository.dart' show IRepository;
import '../loaders/json_loader.dart';
import '../models/quiz_v2.dart';
import 'constants_table_names.dart' show chaptersTableName, quizzesTableName;

class QuizRepositoryV2 implements IRepository<QuizV2> {
  final Database db;
  static const String tableName = 'quizzes';
  static const String joinTableName = 'chapters';

  QuizRepositoryV2({required this.db});

  @override
  Future<bool> delete(QuizV2 data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<QuizV2> find({required int id, bool includes = false}) {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<List<QuizV2>> findAll({bool includes = false}) async {
    if (includes) {
      var records = await db.rawQuery('''
          SELECT
            q.id as quiz_id,
            q.title,
            c.id as chapter_id,
            c.sort_order,
            c.hint,
            c.question,
            c.comment,
            c.correct_area_x,
            c.correct_area_y,
            c.correct_area_width,
            c.correct_area_height
          FROM
            $tableName AS q
          INNER JOIN
            $joinTableName AS c
          ON
            q.id = c.quiz_id;
          ''');

      var recoredsMapByQuizId =
          records.groupListsBy((record) => record['quiz_id']);

      List<QuizV2> quizzes = [];
      recoredsMapByQuizId.forEach((quizId, records) {
        List<Chapter> chapters = records.map((r) {
          return Chapter(
            id: r['chapter_id'] as int,
            quizId: r['quiz_id'] as int,
            sortOrder: r['sort_order'] as int,
            hint: r['hint'] as String,
            question: r['question'] as String,
            comment: r['comment'] as String,
            correctAreaX: r['correct_area_x'] as int,
            correctAreaY: r['correct_area_y'] as int,
            correctAreaWidth: r['correct_area_width'] as int,
            correctAreaHeight: r['correct_area_height'] as int,
          );
        }).toList();
        var firstRecord = records.first;
        QuizV2 quiz = QuizV2(
            id: firstRecord['quiz_id'] as int,
            title: firstRecord['title'] as String,
            chapters: chapters);
        quizzes.add(quiz);
      });

      return quizzes;
    } else {
      var records = await db.query(quizzesTableName);
      return records.map((record) => QuizV2.fromJson(record)).toList();
    }
  }

  @override
  Future<List<QuizV2>> findWhere(
      {required String where, bool includes = false}) {
    // TODO: implement findWhere
    throw UnimplementedError();
  }

  @override
  Future<bool> save(QuizV2 data) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAll(List<QuizV2> dataList) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }
}
