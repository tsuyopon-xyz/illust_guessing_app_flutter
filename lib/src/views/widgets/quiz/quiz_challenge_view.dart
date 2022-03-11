import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:illust_guessing_app/src/models/chapter.dart';
import 'package:illust_guessing_app/src/views/widgets/quiz/quiz_dialog.dart'
    show showQuizDialog;

class QuizChallengeView extends HookConsumerWidget {
  final Chapter chapter;
  final ValueNotifier<int> chapterIndexNotifier;

  const QuizChallengeView(
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
            showQuizDialog(context: context, title: 'はずれ');
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
