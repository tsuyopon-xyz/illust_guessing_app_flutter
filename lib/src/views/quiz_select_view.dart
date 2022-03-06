import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/models/quiz_status.dart';
import 'package:illust_guessing_app/src/providers/selected_quiz_progress_provider.dart';

import '../providers/quiz_list_provider.dart' show quizListProvider;
import '../providers/quiz_status_list_provider.dart'
    show quizStatusListProvider;
import '../models/quiz.dart' show Quiz;

class QuizSelectView extends ConsumerWidget {
  const QuizSelectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Quiz>> asyncValue = ref.watch(quizListProvider);
    var quizStatusList = ref.watch(quizStatusListProvider);

    return asyncValue.when(data: (List<Quiz> quizList) {
      // 一番最初のアプリ起動時はSharedPreferencesに保存されていないあめ、
      if (quizStatusList.isEmpty) {
        // TODO: 初期化処理をアプリ読み込み時に行う
        var newQuizStatusList = quizList.asMap().entries.map((entry) {
          int index = entry.key;
          var quiz = entry.value;

          // 最初のステージはオープンにしておく
          return QuizStatus(quizId: quiz.id, isLocked: index != 0);
        }).toList();

        final notifier = ref.read(quizStatusListProvider.notifier);
        notifier.save(newQuizStatusList);

        return const Center(child: Text('No QuizStatusList'));
      }

      // テスト用 : ローカル保存したデータを削除
      // if (quizStatusList.isNotEmpty) {
      //   final notifier = ref.read(quizStatusListProvider.notifier);
      //   notifier.delete();
      // }

      return _QuizListView(quizList: quizList);
    }, error: (error, stack) {
      print(error);
      return const Center(child: Text('Error...'));
    }, loading: () {
      return const Center(child: Text('Loading...'));
    });
  }
}

class _QuizListView extends ConsumerWidget {
  const _QuizListView({Key? key, required this.quizList}) : super(key: key);

  final List<Quiz> quizList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quizStatusList = ref.watch(quizStatusListProvider);

    return ListView.separated(
      itemCount: quizList.length,
      itemBuilder: (BuildContext context, int index) {
        final quiz = quizList[index];
        final quizStatus = quizStatusList.firstWhere(
            (_quizStatus) => _quizStatus.quizId == quiz.id,
            orElse: () => QuizStatus(quizId: -1) // -1 == Not Found
            );

        // TODO: ステージのクリア状況を管理するstateを用意して、idを元にロックが解除されているか確認する

        return Container(
          decoration: quizStatus.isLocked
              ? new BoxDecoration(color: Colors.grey.shade400)
              : null,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            enabled: !quizStatus.isLocked,
            onTap: () {
              final sqp = ref.read(selectedQuizProgressProvider.notifier);
              final _quiz = sqp.state.quiz;

              if (_quiz == null) {
                print("Quizセットします");
                sqp.selectQuiz(quiz);
              } else if (sqp.hasNextChapter()) {
                print("次のチャプターに移動");
                sqp.goToNextChapter();
              } else {
                print("チャプター終わってます");
              }
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                quizStatus.isLocked
                    ? const Icon(Icons.lock)
                    : quizStatus.isCompleted
                        ? Icon(Icons.check_circle, color: Colors.green.shade400)
                        : Icon(Icons.lock_open, color: Colors.orange.shade400)
              ],
            ),
            title: Text(quiz.id.toString(),
                style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600)),
            subtitle: Text(quiz.title,
                style: TextStyle(fontSize: 18.0, color: Colors.grey.shade900)),
            selectedColor: Colors.indigo.shade600,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 0);
      },
    );
  }
}
