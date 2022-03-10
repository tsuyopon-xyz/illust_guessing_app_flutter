import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/models/chapter.dart';
import 'package:illust_guessing_app/src/models/quiz_v2.dart';
import 'package:illust_guessing_app/src/views/widgets/common/wrap_scaffold.dart'
    show WrapScaffold;

class QuizPage extends HookConsumerWidget {
  final QuizV2 quiz;

  const QuizPage({Key? key, required this.quiz}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(quiz.title),
          actions: [
            IconButton(
                onPressed: () {
                  context.pushNamed('settings');
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: _QuizImageView(
          quiz: quiz,
        ));
  }
}

class _QuizImageView extends HookConsumerWidget {
  final QuizV2 quiz;

  const _QuizImageView({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapterIndex = useState(0);
    final chapter = quiz.chapters?.elementAt(chapterIndex.value);
    if (chapter == null) {
      return const Center(
        child: Text('Chapter is not found'),
      );
    }

    return Center(
      child: Image.asset(chapter.imagePath),
    );
  }
}
