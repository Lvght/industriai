// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compose_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComposeState {
  bool get isRecording => throw _privateConstructorUsedError;
  bool get isSending => throw _privateConstructorUsedError;

  /// Create a copy of ComposeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComposeStateCopyWith<ComposeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComposeStateCopyWith<$Res> {
  factory $ComposeStateCopyWith(
          ComposeState value, $Res Function(ComposeState) then) =
      _$ComposeStateCopyWithImpl<$Res, ComposeState>;
  @useResult
  $Res call({bool isRecording, bool isSending});
}

/// @nodoc
class _$ComposeStateCopyWithImpl<$Res, $Val extends ComposeState>
    implements $ComposeStateCopyWith<$Res> {
  _$ComposeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComposeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? isSending = null,
  }) {
    return _then(_value.copyWith(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComposeStateImplCopyWith<$Res>
    implements $ComposeStateCopyWith<$Res> {
  factory _$$ComposeStateImplCopyWith(
          _$ComposeStateImpl value, $Res Function(_$ComposeStateImpl) then) =
      __$$ComposeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isRecording, bool isSending});
}

/// @nodoc
class __$$ComposeStateImplCopyWithImpl<$Res>
    extends _$ComposeStateCopyWithImpl<$Res, _$ComposeStateImpl>
    implements _$$ComposeStateImplCopyWith<$Res> {
  __$$ComposeStateImplCopyWithImpl(
      _$ComposeStateImpl _value, $Res Function(_$ComposeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComposeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? isSending = null,
  }) {
    return _then(_$ComposeStateImpl(
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ComposeStateImpl implements _ComposeState {
  const _$ComposeStateImpl(
      {required this.isRecording, required this.isSending});

  @override
  final bool isRecording;
  @override
  final bool isSending;

  @override
  String toString() {
    return 'ComposeState(isRecording: $isRecording, isSending: $isSending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComposeStateImpl &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRecording, isSending);

  /// Create a copy of ComposeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComposeStateImplCopyWith<_$ComposeStateImpl> get copyWith =>
      __$$ComposeStateImplCopyWithImpl<_$ComposeStateImpl>(this, _$identity);
}

abstract class _ComposeState implements ComposeState {
  const factory _ComposeState(
      {required final bool isRecording,
      required final bool isSending}) = _$ComposeStateImpl;

  @override
  bool get isRecording;
  @override
  bool get isSending;

  /// Create a copy of ComposeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComposeStateImplCopyWith<_$ComposeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
