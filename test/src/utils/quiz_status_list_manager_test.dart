import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/models/quiz_status.dart';
import 'package:illust_guessing_app/src/utils/quiz_status_list_manager.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late QuizStatusListManager _quizStatusListManager;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    _quizStatusListManager = QuizStatusListManager();
  });

  tearDownAll(() async {
    await _quizStatusListManager.delete();
  });

  test('Check behavior of Save, load and remove', () async {
    List<QuizStatus> quizStatusList = [
      QuizStatus(quizId: 1),
      QuizStatus(quizId: 2),
      QuizStatus(quizId: 3),
    ];

    // 保存の動作確認
    bool isSaveSucceeded = await _quizStatusListManager.save(quizStatusList);
    expect(isSaveSucceeded, true);

    // // 読み込みの動作確認
    List<QuizStatus> loadedData = await _quizStatusListManager.load();
    expect(loadedData.length, quizStatusList.length);
    expect(quizStatusList, loadedData);

    // // 削除の動作確認
    bool isDeleteSucceeded = await _quizStatusListManager.delete();
    List<QuizStatus> loadedDataAfterDelete =
        await _quizStatusListManager.load();
    expect(isDeleteSucceeded, true);
    expect(loadedDataAfterDelete.length, 0);
  });
}
