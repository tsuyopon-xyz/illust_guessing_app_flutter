// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizChapter _$QuizChapterFromJson(Map<String, dynamic> json) {
  return _QuizChapter.fromJson(json);
}

/// @nodoc
class _$QuizChapterTearOff {
  const _$QuizChapterTearOff();

  _QuizChapter call(
      {required int order,
      required String question,
      required String hint,
      required String comment,
      @JsonKey(name: 'correct_area') required _CorrectArea correctArea}) {
    return _QuizChapter(
      order: order,
      question: question,
      hint: hint,
      comment: comment,
      correctArea: correctArea,
    );
  }

  QuizChapter fromJson(Map<String, Object?> json) {
    return QuizChapter.fromJson(json);
  }
}

/// @nodoc
const $QuizChapter = _$QuizChapterTearOff();

/// @nodoc
mixin _$QuizChapter {
  int get order => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get hint => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_area')
  _CorrectArea get correctArea => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizChapterCopyWith<QuizChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizChapterCopyWith<$Res> {
  factory $QuizChapterCopyWith(
          QuizChapter value, $Res Function(QuizChapter) then) =
      _$QuizChapterCopyWithImpl<$Res>;
  $Res call(
      {int order,
      String question,
      String hint,
      String comment,
      @JsonKey(name: 'correct_area') _CorrectArea correctArea});

  _$CorrectAreaCopyWith<$Res> get correctArea;
}

/// @nodoc
class _$QuizChapterCopyWithImpl<$Res> implements $QuizChapterCopyWith<$Res> {
  _$QuizChapterCopyWithImpl(this._value, this._then);

  final QuizChapter _value;
  // ignore: unused_field
  final $Res Function(QuizChapter) _then;

  @override
  $Res call({
    Object? order = freezed,
    Object? question = freezed,
    Object? hint = freezed,
    Object? comment = freezed,
    Object? correctArea = freezed,
  }) {
    return _then(_value.copyWith(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      correctArea: correctArea == freezed
          ? _value.correctArea
          : correctArea // ignore: cast_nullable_to_non_nullable
              as _CorrectArea,
    ));
  }

  @override
  _$CorrectAreaCopyWith<$Res> get correctArea {
    return _$CorrectAreaCopyWith<$Res>(_value.correctArea, (value) {
      return _then(_value.copyWith(correctArea: value));
    });
  }
}

/// @nodoc
abstract class _$QuizChapterCopyWith<$Res>
    implements $QuizChapterCopyWith<$Res> {
  factory _$QuizChapterCopyWith(
          _QuizChapter value, $Res Function(_QuizChapter) then) =
      __$QuizChapterCopyWithImpl<$Res>;
  @override
  $Res call(
      {int order,
      String question,
      String hint,
      String comment,
      @JsonKey(name: 'correct_area') _CorrectArea correctArea});

  @override
  _$CorrectAreaCopyWith<$Res> get correctArea;
}

/// @nodoc
class __$QuizChapterCopyWithImpl<$Res> extends _$QuizChapterCopyWithImpl<$Res>
    implements _$QuizChapterCopyWith<$Res> {
  __$QuizChapterCopyWithImpl(
      _QuizChapter _value, $Res Function(_QuizChapter) _then)
      : super(_value, (v) => _then(v as _QuizChapter));

  @override
  _QuizChapter get _value => super._value as _QuizChapter;

  @override
  $Res call({
    Object? order = freezed,
    Object? question = freezed,
    Object? hint = freezed,
    Object? comment = freezed,
    Object? correctArea = freezed,
  }) {
    return _then(_QuizChapter(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      hint: hint == freezed
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      correctArea: correctArea == freezed
          ? _value.correctArea
          : correctArea // ignore: cast_nullable_to_non_nullable
              as _CorrectArea,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizChapter implements _QuizChapter {
  _$_QuizChapter(
      {required this.order,
      required this.question,
      required this.hint,
      required this.comment,
      @JsonKey(name: 'correct_area') required this.correctArea});

  factory _$_QuizChapter.fromJson(Map<String, dynamic> json) =>
      _$$_QuizChapterFromJson(json);

  @override
  final int order;
  @override
  final String question;
  @override
  final String hint;
  @override
  final String comment;
  @override
  @JsonKey(name: 'correct_area')
  final _CorrectArea correctArea;

  @override
  String toString() {
    return 'QuizChapter(order: $order, question: $question, hint: $hint, comment: $comment, correctArea: $correctArea)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizChapter &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.hint, hint) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.correctArea, correctArea));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(hint),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(correctArea));

  @JsonKey(ignore: true)
  @override
  _$QuizChapterCopyWith<_QuizChapter> get copyWith =>
      __$QuizChapterCopyWithImpl<_QuizChapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizChapterToJson(this);
  }
}

abstract class _QuizChapter implements QuizChapter {
  factory _QuizChapter(
          {required int order,
          required String question,
          required String hint,
          required String comment,
          @JsonKey(name: 'correct_area') required _CorrectArea correctArea}) =
      _$_QuizChapter;

  factory _QuizChapter.fromJson(Map<String, dynamic> json) =
      _$_QuizChapter.fromJson;

  @override
  int get order;
  @override
  String get question;
  @override
  String get hint;
  @override
  String get comment;
  @override
  @JsonKey(name: 'correct_area')
  _CorrectArea get correctArea;
  @override
  @JsonKey(ignore: true)
  _$QuizChapterCopyWith<_QuizChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

_CorrectArea _$_CorrectAreaFromJson(Map<String, dynamic> json) {
  return __CorrectArea.fromJson(json);
}

/// @nodoc
class _$_CorrectAreaTearOff {
  const _$_CorrectAreaTearOff();

  __CorrectArea call(
      {required double x,
      required double y,
      required double width,
      required double height}) {
    return __CorrectArea(
      x: x,
      y: y,
      width: width,
      height: height,
    );
  }

  _CorrectArea fromJson(Map<String, Object?> json) {
    return _CorrectArea.fromJson(json);
  }
}

/// @nodoc
const _$CorrectArea = _$_CorrectAreaTearOff();

/// @nodoc
mixin _$_CorrectArea {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CorrectAreaCopyWith<_CorrectArea> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CorrectAreaCopyWith<$Res> {
  factory _$CorrectAreaCopyWith(
          _CorrectArea value, $Res Function(_CorrectArea) then) =
      __$CorrectAreaCopyWithImpl<$Res>;
  $Res call({double x, double y, double width, double height});
}

/// @nodoc
class __$CorrectAreaCopyWithImpl<$Res> implements _$CorrectAreaCopyWith<$Res> {
  __$CorrectAreaCopyWithImpl(this._value, this._then);

  final _CorrectArea _value;
  // ignore: unused_field
  final $Res Function(_CorrectArea) _then;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$_CorrectAreaCopyWith<$Res>
    implements _$CorrectAreaCopyWith<$Res> {
  factory _$_CorrectAreaCopyWith(
          __CorrectArea value, $Res Function(__CorrectArea) then) =
      __$_CorrectAreaCopyWithImpl<$Res>;
  @override
  $Res call({double x, double y, double width, double height});
}

/// @nodoc
class __$_CorrectAreaCopyWithImpl<$Res> extends __$CorrectAreaCopyWithImpl<$Res>
    implements _$_CorrectAreaCopyWith<$Res> {
  __$_CorrectAreaCopyWithImpl(
      __CorrectArea _value, $Res Function(__CorrectArea) _then)
      : super(_value, (v) => _then(v as __CorrectArea));

  @override
  __CorrectArea get _value => super._value as __CorrectArea;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(__CorrectArea(
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$__CorrectArea implements __CorrectArea {
  _$__CorrectArea(
      {required this.x,
      required this.y,
      required this.width,
      required this.height});

  factory _$__CorrectArea.fromJson(Map<String, dynamic> json) =>
      _$$__CorrectAreaFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  final double width;
  @override
  final double height;

  @override
  String toString() {
    return '_CorrectArea(x: $x, y: $y, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is __CorrectArea &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(y),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height));

  @JsonKey(ignore: true)
  @override
  _$_CorrectAreaCopyWith<__CorrectArea> get copyWith =>
      __$_CorrectAreaCopyWithImpl<__CorrectArea>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$__CorrectAreaToJson(this);
  }
}

abstract class __CorrectArea implements _CorrectArea {
  factory __CorrectArea(
      {required double x,
      required double y,
      required double width,
      required double height}) = _$__CorrectArea;

  factory __CorrectArea.fromJson(Map<String, dynamic> json) =
      _$__CorrectArea.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  double get width;
  @override
  double get height;
  @override
  @JsonKey(ignore: true)
  _$_CorrectAreaCopyWith<__CorrectArea> get copyWith =>
      throw _privateConstructorUsedError;
}
