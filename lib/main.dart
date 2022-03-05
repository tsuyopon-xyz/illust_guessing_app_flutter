import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/models/selected_quiz_progress.dart';
import 'package:illust_guessing_app/src/providers/selected_quiz_progress_provider.dart';

import 'src/views/quiz_select_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SelectedQuizProgress sqp = ref.watch(selectedQuizProgressProvider);
    int currentChapterIndex = sqp.currentChapterIndex ?? -1;

    return MaterialApp(
      title: 'イラスト推理($currentChapterIndex)',
      home: Scaffold(
        appBar: AppBar(
          title: Text('イラスト推理($currentChapterIndex)'),
        ),
        body: const QuizSelectView(),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'イラスト推理',
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('イラスト推理'),
  //       ),
  //       body: const QuizSelectView(),
  //     ),
  //   );
  // }
}
