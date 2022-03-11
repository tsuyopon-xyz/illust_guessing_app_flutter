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

  void _showHint({required BuildContext context, required Chapter chapter}) {
    _showDialog(context: context, title: 'ヒント', body: chapter.hint);
  }

  void _showQuestion(
      {required BuildContext context, required Chapter chapter}) {
    _showDialog(context: context, title: '出題', body: chapter.question);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chapters = quiz.chapters;
    if (chapters == null || chapters.isEmpty) {
      return const Center(
        child: Text('Chapter is not found'),
      );
    }

    final chapterIndexNotifier = useState(0);
    final chapterIndex = chapterIndexNotifier.value;

    if (chapters.length <= chapterIndex) {
      return WrapScaffold(
          body: Container(
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

    final chapter = chapters[chapterIndex];

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showQuestion(context: context, chapter: chapter);
    });

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
        body: _QuizImageView(
          chapter: chapter,
          chapterIndexNotifier: chapterIndexNotifier,
        ));
  }
}

class _QuizImageView extends HookConsumerWidget {
  final Chapter chapter;
  final ValueNotifier<int> chapterIndexNotifier;

  const _QuizImageView(
      {Key? key, required this.chapter, required this.chapterIndexNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          bool isCorrect = _isCorrectArea(details.localPosition, chapter);
          if (isCorrect) {
            // TODO: 正解ページを表示
            print('正解');
            chapterIndexNotifier.value++;
          } else {
            // TODO: 不正解ページを表示
            print('不正解');
          }
        },
        child: Stack(
          children: [
            Image.asset(
              chapter.imagePath,
            ),

            // To visible correct area.
            Positioned(
              top: chapter.correctAreaY.toDouble(),
              left: chapter.correctAreaX.toDouble(),
              width: chapter.correctAreaWidth.toDouble(),
              height: chapter.correctAreaHeight.toDouble(),
              child: Container(color: Colors.red.shade500.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }

  bool _isCorrectArea(Offset localPosition, Chapter chapter) {
    double left = chapter.correctAreaX.toDouble();
    double top = chapter.correctAreaY.toDouble();
    double right = left + chapter.correctAreaWidth.toDouble();
    double bottom = top + chapter.correctAreaHeight.toDouble();
    double touchX = localPosition.dx;
    double touchY = localPosition.dy;

    return left <= touchX &&
        touchX <= right &&
        top <= touchY &&
        touchY <= bottom;
  }
}

void _showDialog({
  required BuildContext context,
  required String title,
  required String body,
}) {
  showDialog(
      context: context,
      builder: (_context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            ElevatedButton(
              child: const Text("閉じる"),
              onPressed: () {
                Navigator.pop(_context);
              },
            ),
          ],
        );
      });
}
