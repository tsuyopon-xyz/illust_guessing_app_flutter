import 'dart:io';

const quizzesJsonPath = 'assets/data/quizzes.json';

class JsonLoader {
  Future<String> loadQuizzes() async {
    return _load(quizzesJsonPath);
  }

  Future<String> _load(String filePath) async {
    File file = File(filePath);
    bool hasFile = await file.exists();
    if (!hasFile) {
      throw Exception('$filePath is not found.');
    }

    final json = await file.readAsString();

    return json;
  }
}
