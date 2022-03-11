import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/models/chapter.dart';
import 'package:illust_guessing_app/src/models/quiz_v2.dart';
import 'package:illust_guessing_app/src/views/widgets/quiz/chapter_progress_indicator.dart';
import 'package:illust_guessing_app/src/views/widgets/quiz/quiz_challenge_view.dart';
import 'package:illust_guessing_app/src/views/widgets/quiz/quiz_completed_view.dart';
import 'package:illust_guessing_app/src/views/widgets/quiz/quiz_no_chapter_view.dart';
import 'package:illust_guessing_app/src/views/widgets/quiz/quiz_dialog.dart'
    show showQuizDialog;

class QuizPage extends HookConsumerWidget {
  final QuizV2 quiz;

  const QuizPage({Key? key, required this.quiz}) : super(key: key);

  void _showHint({required BuildContext context, required Chapter chapter}) {
    showQuizDialog(context: context, title: 'ヒント', body: chapter.hint);
  }

  void _showQuestion(
      {required BuildContext context, required Chapter chapter}) {
    showQuizDialog(context: context, title: '出題', body: chapter.question);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chapters = quiz.chapters;
    if (chapters == null || chapters.isEmpty) {
      return QuizNoChapterView(quiz: quiz);
    }

    final chapterIndexNotifier = useState(0);
    final chapterIndex = chapterIndexNotifier.value;

    if (chapters.length <= chapterIndex) {
      return QuizCompletedView(quiz: quiz);
    }

    final chapter = chapters[chapterIndex];

    useEffect(() {
      // 更新のたびに出題文を表示したい場合はここのコメントを外す
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _showQuestion(context: context, chapter: chapter);
      });

      return null;
    }, [chapter]);

    return Scaffold(
        appBar: AppBar(
          title: Text(quiz.title),
          actions: [
            IconButton(
                onPressed: () {
                  _showHint(context: context, chapter: chapter);
                },
                icon: const Icon(Icons.lightbulb)),
            IconButton(
                onPressed: () {
                  _showQuestion(context: context, chapter: chapter);
                },
                icon: const Icon(Icons.menu_book)),
            IconButton(
                onPressed: () {
                  context.pushNamed('settings');
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChapterProgressIndicator(
                currentChapterIndex: chapterIndex,
                chapterLength: chapters.length),
            const SizedBox(
              height: 20, // Spacer
            ),
            QuizChallengeView(
              chapter: chapter,
              chapterIndexNotifier: chapterIndexNotifier,
            )
          ],
        ));
  }
}
