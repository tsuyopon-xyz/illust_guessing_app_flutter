import 'dart:convert';
import 'package:illust_guessing_app/src/models/quiz.dart';

import 'i_repository.dart' show IRepository;
import '../loaders/json_loader.dart';
import '../models/quiz.dart';

class QuizRepository implements IRepository<Quiz> {
  @override
  Future<Quiz?> find({required int id, bool includes = false}) {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<List<Quiz>> findAll({bool includes = false}) async {
    final jsonLoader = JsonLoader();
    var jsonString = await jsonLoader.loadQuizzes();
    var decodedJson = json.decode(jsonString) as List<dynamic>;

    return decodedJson.map((q) => Quiz.fromJson(q)).toList();
  }

  @override
  Future<List<Quiz>> findWhere({required String where, bool includes = false}) {
    // TODO: implement findWhere
    throw UnimplementedError();
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
}
