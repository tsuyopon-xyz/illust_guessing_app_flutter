// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return _Chapter.fromJson(json);
}

/// @nodoc
class _$ChapterTearOff {
  const _$ChapterTearOff();

  _Chapter call(
      {int? id,
      @JsonKey(name: 'quiz_id') required int quizId,
      @JsonKey(name: 'sort_order') required int sortOrder,
      required String hint,
      required String comment,
      @JsonKey(name: 'correct_area_x') required int correctAreaX,
      @JsonKey(name: 'correct_area_y') required int correctAreaY,
      @JsonKey(name: 'correct_area_width') required int correctAreaWidth,
      @JsonKey(name: 'correct_area_height') required int correctAreaHeight,
      QuizV2? quiz}) {
    return _Chapter(
      id: id,
      quizId: quizId,
      sortOrder: sortOrder,
      hint: hint,
      comment: comment,
      correctAreaX: correctAreaX,
      correctAreaY: correctAreaY,
      correctAreaWidth: correctAreaWidth,
      correctAreaHeight: correctAreaHeight,
      quiz: quiz,
    );
  }

  Chapter fromJson(Map<String, Object?> json) {
    return Chapter.fromJson(json);
  }
}

/// @nodoc
const $Chapter = _$ChapterTearOff();

/// @nodoc
mixin _$Chapter {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_id')
  int get quizId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  String get hint => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_area_x')
  int get correctAreaX => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_area_y')
  int get correctAreaY => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_area_width')
  int get correctAreaWidth => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_area_height')
  int get correctAreaHeight => throw _privateConstructorUsedError;
  QuizV2? get quiz => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'quiz_id') int quizId,
      @JsonKey(name: 'sort_order') int sortOrder,
      String hint,
      String comment,
      @JsonKey(name: 'correct_area_x') int correctAreaX,
      @JsonKey(name: 'correct_area_y') int correctAreaY,
      @JsonKey(name: 'correct_area_width') int correctAreaWidth,
      @JsonKey(name: 'correct_area_height') int correctAreaHeight,
      QuizV2? quiz});

  $QuizV2CopyWith<$Res>? get quiz;
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res> implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  final Chapter _value;
  // ignore: unused_field
  final $Res Function(Chapter) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? quizId = freezed,
    Object? sortOrder = freezed,
    Object? hint = freezed,
    Object? comment = freezed,
    Object? correctAreaX = freezed,
    Object? correctAreaY = freezed,
    Object? correctAreaWidth = freezed,
    Object? correctAreaHeight = freezed,
    Object? quiz = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quizId: quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: sortOrder == freezed
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      correctAreaX: correctAreaX == freezed
          ? _value.correctAreaX
          : correctAreaX // ignore: cast_nullable_to_non_nullable
              as int,
      correctAreaY: correctAreaY == freezed
          ? _value.correctAreaY
          : correctAreaY // ignore: cast_nullable_to_non_nullable
              as int,
      correctAreaWidth: correctAreaWidth == freezed
          ? _value.correctAreaWidth
          : correctAreaWidth // ignore: cast_nullable_to_non_nullable
              as int,
      correctAreaHeight: correctAreaHeight == freezed
          ? _value.correctAreaHeight
          : correctAreaHeight // ignore: cast_nullable_to_non_nullable
              as int,
      quiz: quiz == freezed
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as QuizV2?,
    ));
  }

  @override
  $QuizV2CopyWith<$Res>? get quiz {
    if (_value.quiz == null) {
      return null;
    }

    return $QuizV2CopyWith<$Res>(_value.quiz!, (value) {
      return _then(_value.copyWith(quiz: value));
    });
  }
}

/// @nodoc
abstract class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) then) =
      __$ChapterCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'quiz_id') int quizId,
      @JsonKey(name: 'sort_order') int sortOrder,
      String hint,
      String comment,
      @JsonKey(name: 'correct_area_x') int correctAreaX,
      @JsonKey(name: 'correct_area_y') int correctAreaY,
      @JsonKey(name: 'correct_area_width') int correctAreaWidth,
      @JsonKey(name: 'correct_area_height') int correctAreaHeight,
      QuizV2? quiz});

  @override
  $QuizV2CopyWith<$Res>? get quiz;
}

/// @nodoc
class __$ChapterCopyWithImpl<$Res> extends _$ChapterCopyWithImpl<$Res>
    implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(_Chapter _value, $Res Function(_Chapter) _then)
      : super(_value, (v) => _then(v as _Chapter));

  @override
  _Chapter get _value => super._value as _Chapter;

  @override
  $Res call({
    Object? id = freezed,
    Object? quizId = freezed,
    Object? sortOrder = freezed,
    Object? hint = freezed,
    Object? comment = freezed,
    Object? correctAreaX = freezed,
    Object? correctAreaY = freezed,
    Object? correctAreaWidth = freezed,
    Object? correctAreaHeight = freezed,
    Object? quiz = freezed,
  }) {
    return _then(_Chapter(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quizId: quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: sortOrder == freezed
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      correctAreaX: correctAreaX == freezed
          ? _value.correctAreaX
          : correctAreaX // ignore: cast_nullable_to_non_nullable
              as int,
      correctAreaY: correctAreaY == freezed
          ? _value.correctAreaY
          : correctAreaY // ignore: cast_nullable_to_non_nullable
              as int,
      correctAreaWidth: correctAreaWidth == freezed
          ? _value.correctAreaWidth
          : correctAreaWidth // ignore: cast_nullable_to_non_nullable
              as int,
      correctAreaHeight: correctAreaHeight == freezed
          ? _value.correctAreaHeight
          : correctAreaHeight // ignore: cast_nullable_to_non_nullable
              as int,
      quiz: quiz == freezed
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as QuizV2?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chapter implements _Chapter {
  _$_Chapter(
      {this.id,
      @JsonKey(name: 'quiz_id') required this.quizId,
      @JsonKey(name: 'sort_order') required this.sortOrder,
      required this.hint,
      required this.comment,
      @JsonKey(name: 'correct_area_x') required this.correctAreaX,
      @JsonKey(name: 'correct_area_y') required this.correctAreaY,
      @JsonKey(name: 'correct_area_width') required this.correctAreaWidth,
      @JsonKey(name: 'correct_area_height') required this.correctAreaHeight,
      this.quiz});

  factory _$_Chapter.fromJson(Map<String, dynamic> json) =>
      _$$_ChapterFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'quiz_id')
  final int quizId;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  @override
  final String hint;
  @override
  final String comment;
  @override
  @JsonKey(name: 'correct_area_x')
  final int correctAreaX;
  @override
  @JsonKey(name: 'correct_area_y')
  final int correctAreaY;
  @override
  @JsonKey(name: 'correct_area_width')
  final int correctAreaWidth;
  @override
  @JsonKey(name: 'correct_area_height')
  final int correctAreaHeight;
  @override
  final QuizV2? quiz;

  @override
  String toString() {
    return 'Chapter(id: $id, quizId: $quizId, sortOrder: $sortOrder, hint: $hint, comment: $comment, correctAreaX: $correctAreaX, correctAreaY: $correctAreaY, correctAreaWidth: $correctAreaWidth, correctAreaHeight: $correctAreaHeight, quiz: $quiz)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Chapter &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.quizId, quizId) &&
            const DeepCollectionEquality().equals(other.sortOrder, sortOrder) &&
            const DeepCollectionEquality().equals(other.hint, hint) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.correctAreaX, correctAreaX) &&
            const DeepCollectionEquality()
                .equals(other.correctAreaY, correctAreaY) &&
            const DeepCollectionEquality()
                .equals(other.correctAreaWidth, correctAreaWidth) &&
            const DeepCollectionEquality()
                .equals(other.correctAreaHeight, correctAreaHeight) &&
            const DeepCollectionEquality().equals(other.quiz, quiz));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(quizId),
      const DeepCollectionEquality().hash(sortOrder),
      const DeepCollectionEquality().hash(hint),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(correctAreaX),
      const DeepCollectionEquality().hash(correctAreaY),
      const DeepCollectionEquality().hash(correctAreaWidth),
      const DeepCollectionEquality().hash(correctAreaHeight),
      const DeepCollectionEquality().hash(quiz));

  @JsonKey(ignore: true)
  @override
  _$ChapterCopyWith<_Chapter> get copyWith =>
      __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChapterToJson(this);
  }
}

abstract class _Chapter implements Chapter {
  factory _Chapter(
      {int? id,
      @JsonKey(name: 'quiz_id') required int quizId,
      @JsonKey(name: 'sort_order') required int sortOrder,
      required String hint,
      required String comment,
      @JsonKey(name: 'correct_area_x') required int correctAreaX,
      @JsonKey(name: 'correct_area_y') required int correctAreaY,
      @JsonKey(name: 'correct_area_width') required int correctAreaWidth,
      @JsonKey(name: 'correct_area_height') required int correctAreaHeight,
      QuizV2? quiz}) = _$_Chapter;

  factory _Chapter.fromJson(Map<String, dynamic> json) = _$_Chapter.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'quiz_id')
  int get quizId;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  String get hint;
  @override
  String get comment;
  @override
  @JsonKey(name: 'correct_area_x')
  int get correctAreaX;
  @override
  @JsonKey(name: 'correct_area_y')
  int get correctAreaY;
  @override
  @JsonKey(name: 'correct_area_width')
  int get correctAreaWidth;
  @override
  @JsonKey(name: 'correct_area_height')
  int get correctAreaHeight;
  @override
  QuizV2? get quiz;
  @override
  @JsonKey(ignore: true)
  _$ChapterCopyWith<_Chapter> get copyWith =>
      throw _privateConstructorUsedError;
}
