import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/views/widgets/common/wrap_scaffold.dart'
    show WrapScaffold;

class QuizPage extends HookConsumerWidget {
  final int quizId;

  const QuizPage({Key? key, required this.quizId}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WrapScaffold(
        title: 'クイズページ', body: Center(child: Text("quizId is $quizId")));
  }
}
