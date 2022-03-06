import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quiz_status.dart';

class QuizStatusListManager {
  static const _prefKey = 'quiz_status_list_manager';

  Future<List<QuizStatus>> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? jsonString = prefs.getString(_prefKey);
      if (jsonString == null) {
        return [];
      }

      List<dynamic> decodedJson = json.decode(jsonString);
      List<QuizStatus> quizStatusList = decodedJson.map((dynamicMap) {
        Map<String, dynamic> castMap = {};
        dynamicMap.forEach((key, value) {
          castMap[key] = dynamicMap[key];
        });

        return QuizStatus.fromJson(castMap);
      }).toList();

      return quizStatusList;
    } catch (e) {
      return [];
    }
  }

  Future<bool> save(List<QuizStatus> quizStatusList) async {
    String jsonString = json.encode(quizStatusList);
    final prefs = await SharedPreferences.getInstance();
    bool isSaved = await prefs.setString(_prefKey, jsonString);

    return isSaved;
  }

  Future<bool> delete() async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.remove(_prefKey);
  }
}
