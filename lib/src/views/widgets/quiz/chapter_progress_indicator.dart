import 'package:flutter/material.dart';

class ChapterProgressIndicator extends StatelessWidget {
  final int currentChapterIndex;
  final int chapterLength;

  const ChapterProgressIndicator(
      {Key? key,
      required this.currentChapterIndex,
      required this.chapterLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int sideMargin = 100;
    double progressTextWidth = (width - sideMargin) / chapterLength;

    List<Widget> textList = List.generate(chapterLength, (index) {
      int chapterNumber = index + 1;
      bool isPlayingChapter = currentChapterIndex == index;
      Color bgColor = isPlayingChapter ? Colors.white : Colors.grey.shade400;
      Color textColor =
          isPlayingChapter ? Colors.red.shade400 : Colors.grey.shade900;

      Widget progresIndicator = Container(
          width: progressTextWidth,
          height: 20,
          decoration: BoxDecoration(color: bgColor, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
          child: Center(
              child: Text(chapterNumber.toString(),
                  style: TextStyle(color: textColor))));

      if (index == 0) {
        return progresIndicator;
      } else {
        return Row(children: [
          const SizedBox(width: 10),
          Container(
              width: progressTextWidth,
              height: 20,
              decoration: BoxDecoration(color: Colors.grey.shade400),
              child: progresIndicator)
        ]);
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: textList,
    );
  }
}
