// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_v2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizV2 _$QuizV2FromJson(Map<String, dynamic> json) {
  return _QuizV2.fromJson(json);
}

/// @nodoc
class _$QuizV2TearOff {
  const _$QuizV2TearOff();

  _QuizV2 call(
      {required int id, required String title, List<Chapter>? chapters}) {
    return _QuizV2(
      id: id,
      title: title,
      chapters: chapters,
    );
  }

  QuizV2 fromJson(Map<String, Object?> json) {
    return QuizV2.fromJson(json);
  }
}

/// @nodoc
const $QuizV2 = _$QuizV2TearOff();

/// @nodoc
mixin _$QuizV2 {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<Chapter>? get chapters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizV2CopyWith<QuizV2> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizV2CopyWith<$Res> {
  factory $QuizV2CopyWith(QuizV2 value, $Res Function(QuizV2) then) =
      _$QuizV2CopyWithImpl<$Res>;
  $Res call({int id, String title, List<Chapter>? chapters});
}

/// @nodoc
class _$QuizV2CopyWithImpl<$Res> implements $QuizV2CopyWith<$Res> {
  _$QuizV2CopyWithImpl(this._value, this._then);

  final QuizV2 _value;
  // ignore: unused_field
  final $Res Function(QuizV2) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? chapters = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
    ));
  }
}

/// @nodoc
abstract class _$QuizV2CopyWith<$Res> implements $QuizV2CopyWith<$Res> {
  factory _$QuizV2CopyWith(_QuizV2 value, $Res Function(_QuizV2) then) =
      __$QuizV2CopyWithImpl<$Res>;
  @override
  $Res call({int id, String title, List<Chapter>? chapters});
}

/// @nodoc
class __$QuizV2CopyWithImpl<$Res> extends _$QuizV2CopyWithImpl<$Res>
    implements _$QuizV2CopyWith<$Res> {
  __$QuizV2CopyWithImpl(_QuizV2 _value, $Res Function(_QuizV2) _then)
      : super(_value, (v) => _then(v as _QuizV2));

  @override
  _QuizV2 get _value => super._value as _QuizV2;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? chapters = freezed,
  }) {
    return _then(_QuizV2(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: chapters == freezed
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizV2 implements _QuizV2 {
  _$_QuizV2({required this.id, required this.title, this.chapters});

  factory _$_QuizV2.fromJson(Map<String, dynamic> json) =>
      _$$_QuizV2FromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final List<Chapter>? chapters;

  @override
  String toString() {
    return 'QuizV2(id: $id, title: $title, chapters: $chapters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizV2 &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.chapters, chapters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(chapters));

  @JsonKey(ignore: true)
  @override
  _$QuizV2CopyWith<_QuizV2> get copyWith =>
      __$QuizV2CopyWithImpl<_QuizV2>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizV2ToJson(this);
  }
}

abstract class _QuizV2 implements QuizV2 {
  factory _QuizV2(
      {required int id,
      required String title,
      List<Chapter>? chapters}) = _$_QuizV2;

  factory _QuizV2.fromJson(Map<String, dynamic> json) = _$_QuizV2.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  List<Chapter>? get chapters;
  @override
  @JsonKey(ignore: true)
  _$QuizV2CopyWith<_QuizV2> get copyWith => throw _privateConstructorUsedError;
}
