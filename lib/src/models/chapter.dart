import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:illust_guessing_app/src/models/quiz_v2.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
class Chapter with _$Chapter {
  factory Chapter(
      {int? id,
      @JsonKey(name: 'quiz_id') required int quizId,
      @JsonKey(name: 'sort_order') required int sortOrder,
      required String hint,
      required String question,
      required String comment,
      @JsonKey(name: 'correct_area_x') required int correctAreaX,
      @JsonKey(name: 'correct_area_y') required int correctAreaY,
      @JsonKey(name: 'correct_area_width') required int correctAreaWidth,
      @JsonKey(name: 'correct_area_height') required int correctAreaHeight,
      QuizV2? quiz}) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}
