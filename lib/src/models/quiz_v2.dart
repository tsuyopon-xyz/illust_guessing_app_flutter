import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:illust_guessing_app/src/models/chapter.dart';

part 'quiz_v2.freezed.dart';
part 'quiz_v2.g.dart';

@freezed
class QuizV2 with _$QuizV2 {
  factory QuizV2({
    required int id,
    required String title,
    List<Chapter>? chapters,
  }) = _QuizV2;

  factory QuizV2.fromJson(Map<String, dynamic> json) => _$QuizV2FromJson(json);
}
