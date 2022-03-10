import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/providers/quiz_list_provider_v2.dart'
    show quizListProviderV2;
import 'package:illust_guessing_app/src/models/quiz_v2.dart' show QuizV2;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Get all quiz instances in a list.', () async {
    final container = ProviderContainer();

    addTearDown(() {
      container.dispose;
    });

    AsyncValue<List<QuizV2>> asyncValue = container.read(quizListProviderV2);
    expect(asyncValue, const AsyncValue<List<QuizV2>>.loading());

    await container.read(quizListProviderV2.future);

    List<QuizV2> quizList = container.read(quizListProviderV2).value!;

    expect(quizList.isNotEmpty, true);
    expect(quizList[0].id, 1);
    expect(quizList[0].title.isNotEmpty, true);
    expect(quizList[0].chapters?.isNotEmpty, true);
  });
}
