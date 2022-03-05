// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizStatus _$QuizStatusFromJson(Map<String, dynamic> json) {
  return _QuizStatus.fromJson(json);
}

/// @nodoc
class _$QuizStatusTearOff {
  const _$QuizStatusTearOff();

  _QuizStatus call(
      {required int quizId,
      int completedChapterCount = 0,
      bool isCompleted = false,
      bool isLocked = true}) {
    return _QuizStatus(
      quizId: quizId,
      completedChapterCount: completedChapterCount,
      isCompleted: isCompleted,
      isLocked: isLocked,
    );
  }

  QuizStatus fromJson(Map<String, Object?> json) {
    return QuizStatus.fromJson(json);
  }
}

/// @nodoc
const $QuizStatus = _$QuizStatusTearOff();

/// @nodoc
mixin _$QuizStatus {
  int get quizId => throw _privateConstructorUsedError;
  int get completedChapterCount => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizStatusCopyWith<QuizStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStatusCopyWith<$Res> {
  factory $QuizStatusCopyWith(
          QuizStatus value, $Res Function(QuizStatus) then) =
      _$QuizStatusCopyWithImpl<$Res>;
  $Res call(
      {int quizId, int completedChapterCount, bool isCompleted, bool isLocked});
}

/// @nodoc
class _$QuizStatusCopyWithImpl<$Res> implements $QuizStatusCopyWith<$Res> {
  _$QuizStatusCopyWithImpl(this._value, this._then);

  final QuizStatus _value;
  // ignore: unused_field
  final $Res Function(QuizStatus) _then;

  @override
  $Res call({
    Object? quizId = freezed,
    Object? completedChapterCount = freezed,
    Object? isCompleted = freezed,
    Object? isLocked = freezed,
  }) {
    return _then(_value.copyWith(
      quizId: quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      completedChapterCount: completedChapterCount == freezed
          ? _value.completedChapterCount
          : completedChapterCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocked: isLocked == freezed
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$QuizStatusCopyWith<$Res> implements $QuizStatusCopyWith<$Res> {
  factory _$QuizStatusCopyWith(
          _QuizStatus value, $Res Function(_QuizStatus) then) =
      __$QuizStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {int quizId, int completedChapterCount, bool isCompleted, bool isLocked});
}

/// @nodoc
class __$QuizStatusCopyWithImpl<$Res> extends _$QuizStatusCopyWithImpl<$Res>
    implements _$QuizStatusCopyWith<$Res> {
  __$QuizStatusCopyWithImpl(
      _QuizStatus _value, $Res Function(_QuizStatus) _then)
      : super(_value, (v) => _then(v as _QuizStatus));

  @override
  _QuizStatus get _value => super._value as _QuizStatus;

  @override
  $Res call({
    Object? quizId = freezed,
    Object? completedChapterCount = freezed,
    Object? isCompleted = freezed,
    Object? isLocked = freezed,
  }) {
    return _then(_QuizStatus(
      quizId: quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      completedChapterCount: completedChapterCount == freezed
          ? _value.completedChapterCount
          : completedChapterCount // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocked: isLocked == freezed
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizStatus implements _QuizStatus {
  _$_QuizStatus(
      {required this.quizId,
      this.completedChapterCount = 0,
      this.isCompleted = false,
      this.isLocked = true});

  factory _$_QuizStatus.fromJson(Map<String, dynamic> json) =>
      _$$_QuizStatusFromJson(json);

  @override
  final int quizId;
  @JsonKey()
  @override
  final int completedChapterCount;
  @JsonKey()
  @override
  final bool isCompleted;
  @JsonKey()
  @override
  final bool isLocked;

  @override
  String toString() {
    return 'QuizStatus(quizId: $quizId, completedChapterCount: $completedChapterCount, isCompleted: $isCompleted, isLocked: $isLocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizStatus &&
            const DeepCollectionEquality().equals(other.quizId, quizId) &&
            const DeepCollectionEquality()
                .equals(other.completedChapterCount, completedChapterCount) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted) &&
            const DeepCollectionEquality().equals(other.isLocked, isLocked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(quizId),
      const DeepCollectionEquality().hash(completedChapterCount),
      const DeepCollectionEquality().hash(isCompleted),
      const DeepCollectionEquality().hash(isLocked));

  @JsonKey(ignore: true)
  @override
  _$QuizStatusCopyWith<_QuizStatus> get copyWith =>
      __$QuizStatusCopyWithImpl<_QuizStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizStatusToJson(this);
  }
}

abstract class _QuizStatus implements QuizStatus {
  factory _QuizStatus(
      {required int quizId,
      int completedChapterCount,
      bool isCompleted,
      bool isLocked}) = _$_QuizStatus;

  factory _QuizStatus.fromJson(Map<String, dynamic> json) =
      _$_QuizStatus.fromJson;

  @override
  int get quizId;
  @override
  int get completedChapterCount;
  @override
  bool get isCompleted;
  @override
  bool get isLocked;
  @override
  @JsonKey(ignore: true)
  _$QuizStatusCopyWith<_QuizStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
