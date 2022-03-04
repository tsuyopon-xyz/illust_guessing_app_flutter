import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/loaders/json_loader.dart';

void main() {
  test('Succeeded loading json file', () async {
    try {
      JsonLoader loader = JsonLoader();
      String json = await loader.loadQuizzes();
      expect(json.isNotEmpty, equals(true));
    } on Exception catch (e) {
      print("error : $e");
      expect(1, equals(0));
    }
  });
}
