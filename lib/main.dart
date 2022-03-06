import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/models/selected_quiz_progress.dart';
import 'package:illust_guessing_app/src/providers/selected_quiz_progress_provider.dart';

import 'src/views/quiz_select_view.dart';

// アプリ起動時
// 1. クイズステータスリストを読み込む
//   - クイズステータスリストがローカルに保存されていない場合は、初回起動を意味する
//     - 初回起動時はクイズステータスリストをローカルに保存する
//       - クイズリストを読み込む
//       - 読み込んだクイズリストを元にクイズステータスリストを作成する
//       - 作成したクイズステータスリストをローカル保存する（SharedPreferences）
// 2. クイズリストを読み込む
// 3. クイズステータスリストの状態を元に、起動時のSelectedQuizProgressの状態を生成する
//   - 一番最後の「isLocked == false」になっているクイズステータスを取得する
//   - クイズステータスの以下の情報をSelectedQuizProgressセットする
//      - quizStatus.quizIdを元に、quizListから対応するquizを取得 -> selectedQuizProgress.quizにセットする
//      - quizStatus.completedChapterCount -> selectedQuizProgress.currentChapterIndexにセットする

Future<void> main() async {
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
      debugShowCheckedModeBanner: false,
      title: 'イラスト推理($currentChapterIndex)',
      home: Scaffold(
        appBar: AppBar(
          title: Text('イラスト推理($currentChapterIndex)'),
        ),
        body: const QuizSelectView(),
      ),
    );
  }
}
