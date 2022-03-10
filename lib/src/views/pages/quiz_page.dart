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
    var chapters = quiz.chapters;
    if (chapters == null || chapters.isEmpty) {
      return const Center(
        child: Text('Chapter is not found'),
      );
    }

    final chapterIndex = useState(0);
    if (chapters.length <= chapterIndex.value) {
      print("Finished Quiz!");
      return const Center(
        child: Text('Finished Quiz!'),
      );
    }

    final chapter = chapters[chapterIndex.value];
    if (chapter == null) {
      return const Center(
        child: Text('Chapter is not found'),
      );
    }

    return Center(
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          bool isCorrect = _isCorrectArea(details.localPosition, chapter);
          if (isCorrect) {
            chapterIndex.value++;
            print("chapterIndex : $chapterIndex");
          }
        },
        child: Stack(
          children: [
            Image.asset(chapter.imagePath),

            // To visible correct area.
            Positioned(
              top: chapter.correctAreaX.toDouble(),
              left: chapter.correctAreaY.toDouble(),
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

    // TODO: touch positionが期待している値と微妙に異なっている部分の調査。
    // 参考: left(70.0)付近をタッチした時の値が32.0になってしまっている
    // left: 70.0, top: 30.0, right: 150.0, bottom: 130.0,
    // touchX: 32.0, touchY: 71.94776119402985
    print(
        "left: $left, top: $top, right: $right, bottom: $bottom, touchX: $touchX, touchY: $touchY");

    return left <= touchX &&
        touchX <= right &&
        top <= touchY &&
        touchY <= bottom;
  }
}
