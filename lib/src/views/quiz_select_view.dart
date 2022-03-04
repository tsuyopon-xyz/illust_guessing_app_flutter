import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/quiz_list_provider.dart' show quizListProvider;
import '../models/quiz.dart' show Quiz;

class QuizSelectView extends ConsumerWidget {
  const QuizSelectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Quiz>> asyncValue = ref.watch(quizListProvider);

    return asyncValue.when(data: (List<Quiz> quizList) {
      return Center(child: _QuizListView(quizList: quizList));
    }, error: (error, stack) {
      print(error);
      return const Center(child: Text('Error...'));
    }, loading: () {
      return const Center(child: Text('Loading...'));
    });
  }
}

class _QuizListView extends StatelessWidget {
  const _QuizListView({Key? key, required this.quizList}) : super(key: key);

  final List<Quiz> quizList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: quizList.length,
      itemBuilder: (BuildContext context, int index) {
        final quiz = quizList[index];

        // TODO: ステージのクリア状況を管理するstateを用意して、idを元にロックが解除されているか確認する
        final isLocked = index % 2 == 1;

        return Container(
          decoration:
              isLocked ? new BoxDecoration(color: Colors.grey.shade400) : null,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            enabled: !isLocked,
            onTap: () {
              print(index);
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLocked
                    ? const Icon(Icons.lock)
                    : Icon(Icons.check_circle, color: Colors.green.shade400)
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
