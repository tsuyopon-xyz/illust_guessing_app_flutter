import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  factory Quiz({
    required int id,
    required String title,
    required List<_QuizChapter> chapters,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
class _QuizChapter with _$_QuizChapter {
  factory _QuizChapter(
          {required int order,
          required String question,
          required String hint,
          required String comment,
          @JsonKey(name: 'correct_area') required _CorrectArea correctArea}) =
      __QuizChapter;

  factory _QuizChapter.fromJson(Map<String, dynamic> json) =>
      _$_QuizChapterFromJson(json);
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
