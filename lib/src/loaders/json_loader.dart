import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_platform/universal_platform.dart';

const quizzesJsonPath = 'assets/data/quizzes.json';

class JsonLoader {
  Future<String> loadQuizzes() async {
    return _load(quizzesJsonPath);
  }

  Future<String> _load(String filePath) async {
    return await rootBundle.loadString(filePath);
  }
}
