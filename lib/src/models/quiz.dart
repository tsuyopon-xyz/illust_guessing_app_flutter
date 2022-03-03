import 'package:freezed_annotation/freezed_annotation.dart';

import 'quiz_chapter.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  factory Quiz({
    required int id,
    required List<QuizChapter> chapters,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}
