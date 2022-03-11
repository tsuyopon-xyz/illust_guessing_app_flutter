import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illust_guessing_app/src/models/quiz_v2.dart';
import 'package:illust_guessing_app/src/views/widgets/common/wrap_scaffold.dart';

class QuizCompletedView extends StatelessWidget {
  final QuizV2 quiz;

  const QuizCompletedView({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapScaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('全問クリア！'),
              ElevatedButton(
                child: const Text("クイズ選択に戻る"),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
        title: quiz.title);
  }
}
