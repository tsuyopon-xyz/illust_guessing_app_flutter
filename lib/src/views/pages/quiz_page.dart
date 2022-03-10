import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/models/quiz_v2.dart';
import 'package:illust_guessing_app/src/views/widgets/common/wrap_scaffold.dart'
    show WrapScaffold;

class QuizPage extends HookConsumerWidget {
  final QuizV2 quiz;

  const QuizPage({Key? key, required this.quiz}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WrapScaffold(
        title: 'クイズページ',
        body: Center(child: Text("quizId is ${quiz.toString()}")));
  }
}
