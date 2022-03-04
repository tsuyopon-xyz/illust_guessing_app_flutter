import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/src/providers/quiz_list_provider.dart';
import 'package:illust_guessing_app/src/models/quiz.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Get all quiz instances in a list.', () async {
    final container = ProviderContainer();
    addTearDown(() {
      print("Finish this test");
      addTearDown(container.dispose);
    });

    AsyncValue<List<Quiz>> asyncValue = container.read(quizListProvider);
    expect(asyncValue, const AsyncValue<List<Quiz>>.loading());

    await container.read(quizListProvider.future);

    List<Quiz> quizList = container.read(quizListProvider).value!;

    expect(quizList.isNotEmpty, true);
    expect(quizList[0].id, 1);
    expect(quizList[0].chapters.length, 4);
  });
}
