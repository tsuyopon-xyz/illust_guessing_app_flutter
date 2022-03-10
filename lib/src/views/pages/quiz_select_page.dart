import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/providers/quiz_list_provider_v2.dart'
    show quizListProviderV2;
import 'package:illust_guessing_app/src/models/quiz_v2.dart' show QuizV2;
import 'package:illust_guessing_app/src/views/widgets/common/loading_indicator.dart'
    show LoadingIndicator;
import 'package:illust_guessing_app/src/views/widgets/common/wrap_scaffold.dart'
    show WrapScaffold;

class QuizSelectPage extends ConsumerWidget {
  const QuizSelectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<QuizV2>> asyncValue = ref.watch(quizListProviderV2);

    return asyncValue.when(data: (List<QuizV2> quizList) {
      return WrapScaffold(
          title: 'クイズ選択ページ', body: _QuizListView(quizList: quizList));
    }, error: (error, stack) {
      print(error);
      return const WrapScaffold(
          title: 'クイズ選択ページ', body: Center(child: Text('Error...')));
    }, loading: () {
      return const WrapScaffold(
          title: 'クイズ選択ページ', body: Center(child: LoadingIndicator()));
    });
  }
}

class _QuizListView extends StatelessWidget {
  const _QuizListView({Key? key, required this.quizList}) : super(key: key);

  final List<QuizV2> quizList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: quizList.length,
      itemBuilder: (BuildContext context, int index) {
        final quiz = quizList[index];

        return Container(
          // TODO: Lock機能を実装したときにコメントを外す。
          // （解放されていないクイズはグレー背景にする）
          // decoration: quizStatus.isLocked
          //     ? new BoxDecoration(color: Colors.grey.shade400)
          //     : null,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            enabled: true,
            onTap: () {
              context.pushNamed('quiz', params: {'quizId': quiz.id.toString()});
            },
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.lock_open, color: Colors.orange.shade400)],
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
