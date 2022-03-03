import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_chapter.freezed.dart';
part 'quiz_chapter.g.dart';

@freezed
class QuizChapter with _$QuizChapter {
  factory QuizChapter(
          {required int order,
          required String question,
          required String hint,
          required String comment,
          @JsonKey(name: 'correct_area') required _CorrectArea correctArea}) =
      _QuizChapter;

  factory QuizChapter.fromJson(Map<String, dynamic> json) =>
      _$QuizChapterFromJson(json);
}

@freezed
class _CorrectArea with _$_CorrectArea {
  factory _CorrectArea({
    required double x,
    required double y,
    required double width,
    required double height,
  }) = __CorrectArea;

  factory _CorrectArea.fromJson(Map<String, dynamic> json) =>
      _$_CorrectAreaFromJson(json);
}
