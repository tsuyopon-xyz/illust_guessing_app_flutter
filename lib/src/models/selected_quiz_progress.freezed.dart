// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'selected_quiz_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelectedQuizProgress _$SelectedQuizProgressFromJson(Map<String, dynamic> json) {
  return _SelectedQuizProgress.fromJson(json);
}

/// @nodoc
class _$SelectedQuizProgressTearOff {
  const _$SelectedQuizProgressTearOff();

  _SelectedQuizProgress call(
      {required Quiz quiz,
      int currentChapterOrder = 1,
      bool hasNextChapter = true}) {
    return _SelectedQuizProgress(
      quiz: quiz,
      currentChapterOrder: currentChapterOrder,
      hasNextChapter: hasNextChapter,
    );
  }

  SelectedQuizProgress fromJson(Map<String, Object?> json) {
    return SelectedQuizProgress.fromJson(json);
  }
}

/// @nodoc
const $SelectedQuizProgress = _$SelectedQuizProgressTearOff();

/// @nodoc
mixin _$SelectedQuizProgress {
  Quiz get quiz => throw _privateConstructorUsedError;
  int get currentChapterOrder => throw _privateConstructorUsedError;
  bool get hasNextChapter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedQuizProgressCopyWith<SelectedQuizProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedQuizProgressCopyWith<$Res> {
  factory $SelectedQuizProgressCopyWith(SelectedQuizProgress value,
          $Res Function(SelectedQuizProgress) then) =
      _$SelectedQuizProgressCopyWithImpl<$Res>;
  $Res call({Quiz quiz, int currentChapterOrder, bool hasNextChapter});

  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class _$SelectedQuizProgressCopyWithImpl<$Res>
    implements $SelectedQuizProgressCopyWith<$Res> {
  _$SelectedQuizProgressCopyWithImpl(this._value, this._then);

  final SelectedQuizProgress _value;
  // ignore: unused_field
  final $Res Function(SelectedQuizProgress) _then;

  @override
  $Res call({
    Object? quiz = freezed,
    Object? currentChapterOrder = freezed,
    Object? hasNextChapter = freezed,
  }) {
    return _then(_value.copyWith(
      quiz: quiz == freezed
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      currentChapterOrder: currentChapterOrder == freezed
          ? _value.currentChapterOrder
          : currentChapterOrder // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextChapter: hasNextChapter == freezed
          ? _value.hasNextChapter
          : hasNextChapter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $QuizCopyWith<$Res> get quiz {
    return $QuizCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value));
    });
  }
}

/// @nodoc
abstract class _$SelectedQuizProgressCopyWith<$Res>
    implements $SelectedQuizProgressCopyWith<$Res> {
  factory _$SelectedQuizProgressCopyWith(_SelectedQuizProgress value,
          $Res Function(_SelectedQuizProgress) then) =
      __$SelectedQuizProgressCopyWithImpl<$Res>;
  @override
  $Res call({Quiz quiz, int currentChapterOrder, bool hasNextChapter});

  @override
  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class __$SelectedQuizProgressCopyWithImpl<$Res>
    extends _$SelectedQuizProgressCopyWithImpl<$Res>
    implements _$SelectedQuizProgressCopyWith<$Res> {
  __$SelectedQuizProgressCopyWithImpl(
      _SelectedQuizProgress _value, $Res Function(_SelectedQuizProgress) _then)
      : super(_value, (v) => _then(v as _SelectedQuizProgress));

  @override
  _SelectedQuizProgress get _value => super._value as _SelectedQuizProgress;

  @override
  $Res call({
    Object? quiz = freezed,
    Object? currentChapterOrder = freezed,
    Object? hasNextChapter = freezed,
  }) {
    return _then(_SelectedQuizProgress(
      quiz: quiz == freezed
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      currentChapterOrder: currentChapterOrder == freezed
          ? _value.currentChapterOrder
          : currentChapterOrder // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextChapter: hasNextChapter == freezed
          ? _value.hasNextChapter
          : hasNextChapter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SelectedQuizProgress implements _SelectedQuizProgress {
  _$_SelectedQuizProgress(
      {required this.quiz,
      this.currentChapterOrder = 1,
      this.hasNextChapter = true});

  factory _$_SelectedQuizProgress.fromJson(Map<String, dynamic> json) =>
      _$$_SelectedQuizProgressFromJson(json);

  @override
  final Quiz quiz;
  @JsonKey()
  @override
  final int currentChapterOrder;
  @JsonKey()
  @override
  final bool hasNextChapter;

  @override
  String toString() {
    return 'SelectedQuizProgress(quiz: $quiz, currentChapterOrder: $currentChapterOrder, hasNextChapter: $hasNextChapter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectedQuizProgress &&
            const DeepCollectionEquality().equals(other.quiz, quiz) &&
            const DeepCollectionEquality()
                .equals(other.currentChapterOrder, currentChapterOrder) &&
            const DeepCollectionEquality()
                .equals(other.hasNextChapter, hasNextChapter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(quiz),
      const DeepCollectionEquality().hash(currentChapterOrder),
      const DeepCollectionEquality().hash(hasNextChapter));

  @JsonKey(ignore: true)
  @override
  _$SelectedQuizProgressCopyWith<_SelectedQuizProgress> get copyWith =>
      __$SelectedQuizProgressCopyWithImpl<_SelectedQuizProgress>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectedQuizProgressToJson(this);
  }
}

abstract class _SelectedQuizProgress implements SelectedQuizProgress {
  factory _SelectedQuizProgress(
      {required Quiz quiz,
      int currentChapterOrder,
      bool hasNextChapter}) = _$_SelectedQuizProgress;

  factory _SelectedQuizProgress.fromJson(Map<String, dynamic> json) =
      _$_SelectedQuizProgress.fromJson;

  @override
  Quiz get quiz;
  @override
  int get currentChapterOrder;
  @override
  bool get hasNextChapter;
  @override
  @JsonKey(ignore: true)
  _$SelectedQuizProgressCopyWith<_SelectedQuizProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
