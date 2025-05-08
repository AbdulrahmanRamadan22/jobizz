// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function() googleAuthenticationLoading,
    required TResult Function(T data) googleAuthenticationSuccess,
    required TResult Function(ApiErrorModel apiErrorModel)
        googleAuthenticationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function()? googleAuthenticationLoading,
    TResult? Function(T data)? googleAuthenticationSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function()? googleAuthenticationLoading,
    TResult Function(T data)? googleAuthenticationSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) failure,
    required TResult Function(GoogleAuthenticationLoading<T> value)
        googleAuthenticationLoading,
    required TResult Function(GoogleAuthenticationSuccess<T> value)
        googleAuthenticationSuccess,
    required TResult Function(GoogleAuthenticationError<T> value)
        googleAuthenticationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? failure,
    TResult? Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult? Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult? Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? failure,
    TResult Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<T, $Res> {
  factory $LoginStateCopyWith(
          LoginState<T> value, $Res Function(LoginState<T>) then) =
      _$LoginStateCopyWithImpl<T, $Res, LoginState<T>>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<T, $Res, $Val extends LoginState<T>>
    implements $LoginStateCopyWith<T, $Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LoginState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function() googleAuthenticationLoading,
    required TResult Function(T data) googleAuthenticationSuccess,
    required TResult Function(ApiErrorModel apiErrorModel)
        googleAuthenticationFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function()? googleAuthenticationLoading,
    TResult? Function(T data)? googleAuthenticationSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function()? googleAuthenticationLoading,
    TResult Function(T data)? googleAuthenticationSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) failure,
    required TResult Function(GoogleAuthenticationLoading<T> value)
        googleAuthenticationLoading,
    required TResult Function(GoogleAuthenticationSuccess<T> value)
        googleAuthenticationSuccess,
    required TResult Function(GoogleAuthenticationError<T> value)
        googleAuthenticationFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? failure,
    TResult? Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult? Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult? Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? failure,
    TResult Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements LoginState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LoginState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function() googleAuthenticationLoading,
    required TResult Function(T data) googleAuthenticationSuccess,
    required TResult Function(ApiErrorModel apiErrorModel)
        googleAuthenticationFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function()? googleAuthenticationLoading,
    TResult? Function(T data)? googleAuthenticationSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function()? googleAuthenticationLoading,
    TResult Function(T data)? googleAuthenticationSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) failure,
    required TResult Function(GoogleAuthenticationLoading<T> value)
        googleAuthenticationLoading,
    required TResult Function(GoogleAuthenticationSuccess<T> value)
        googleAuthenticationSuccess,
    required TResult Function(GoogleAuthenticationError<T> value)
        googleAuthenticationFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? failure,
    TResult? Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult? Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult? Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? failure,
    TResult Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements LoginState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'LoginState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function() googleAuthenticationLoading,
    required TResult Function(T data) googleAuthenticationSuccess,
    required TResult Function(ApiErrorModel apiErrorModel)
        googleAuthenticationFailure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function()? googleAuthenticationLoading,
    TResult? Function(T data)? googleAuthenticationSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function()? googleAuthenticationLoading,
    TResult Function(T data)? googleAuthenticationSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) failure,
    required TResult Function(GoogleAuthenticationLoading<T> value)
        googleAuthenticationLoading,
    required TResult Function(GoogleAuthenticationSuccess<T> value)
        googleAuthenticationSuccess,
    required TResult Function(GoogleAuthenticationError<T> value)
        googleAuthenticationFailure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? failure,
    TResult? Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult? Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult? Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? failure,
    TResult Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements LoginState<T> {
  const factory Success(final T data) = _$SuccessImpl<T>;

  T get data;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$ErrorImpl<T>(
      null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'LoginState<$T>.failure(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function() googleAuthenticationLoading,
    required TResult Function(T data) googleAuthenticationSuccess,
    required TResult Function(ApiErrorModel apiErrorModel)
        googleAuthenticationFailure,
  }) {
    return failure(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function()? googleAuthenticationLoading,
    TResult? Function(T data)? googleAuthenticationSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
  }) {
    return failure?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function()? googleAuthenticationLoading,
    TResult Function(T data)? googleAuthenticationSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) failure,
    required TResult Function(GoogleAuthenticationLoading<T> value)
        googleAuthenticationLoading,
    required TResult Function(GoogleAuthenticationSuccess<T> value)
        googleAuthenticationSuccess,
    required TResult Function(GoogleAuthenticationError<T> value)
        googleAuthenticationFailure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? failure,
    TResult? Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult? Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult? Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? failure,
    TResult Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements LoginState<T> {
  const factory Error(final ApiErrorModel apiErrorModel) = _$ErrorImpl<T>;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleAuthenticationLoadingImplCopyWith<T, $Res> {
  factory _$$GoogleAuthenticationLoadingImplCopyWith(
          _$GoogleAuthenticationLoadingImpl<T> value,
          $Res Function(_$GoogleAuthenticationLoadingImpl<T>) then) =
      __$$GoogleAuthenticationLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GoogleAuthenticationLoadingImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res,
        _$GoogleAuthenticationLoadingImpl<T>>
    implements _$$GoogleAuthenticationLoadingImplCopyWith<T, $Res> {
  __$$GoogleAuthenticationLoadingImplCopyWithImpl(
      _$GoogleAuthenticationLoadingImpl<T> _value,
      $Res Function(_$GoogleAuthenticationLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GoogleAuthenticationLoadingImpl<T>
    implements GoogleAuthenticationLoading<T> {
  const _$GoogleAuthenticationLoadingImpl();

  @override
  String toString() {
    return 'LoginState<$T>.googleAuthenticationLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleAuthenticationLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function() googleAuthenticationLoading,
    required TResult Function(T data) googleAuthenticationSuccess,
    required TResult Function(ApiErrorModel apiErrorModel)
        googleAuthenticationFailure,
  }) {
    return googleAuthenticationLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function()? googleAuthenticationLoading,
    TResult? Function(T data)? googleAuthenticationSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
  }) {
    return googleAuthenticationLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function()? googleAuthenticationLoading,
    TResult Function(T data)? googleAuthenticationSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (googleAuthenticationLoading != null) {
      return googleAuthenticationLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) failure,
    required TResult Function(GoogleAuthenticationLoading<T> value)
        googleAuthenticationLoading,
    required TResult Function(GoogleAuthenticationSuccess<T> value)
        googleAuthenticationSuccess,
    required TResult Function(GoogleAuthenticationError<T> value)
        googleAuthenticationFailure,
  }) {
    return googleAuthenticationLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? failure,
    TResult? Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult? Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult? Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
  }) {
    return googleAuthenticationLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? failure,
    TResult Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (googleAuthenticationLoading != null) {
      return googleAuthenticationLoading(this);
    }
    return orElse();
  }
}

abstract class GoogleAuthenticationLoading<T> implements LoginState<T> {
  const factory GoogleAuthenticationLoading() =
      _$GoogleAuthenticationLoadingImpl<T>;
}

/// @nodoc
abstract class _$$GoogleAuthenticationSuccessImplCopyWith<T, $Res> {
  factory _$$GoogleAuthenticationSuccessImplCopyWith(
          _$GoogleAuthenticationSuccessImpl<T> value,
          $Res Function(_$GoogleAuthenticationSuccessImpl<T>) then) =
      __$$GoogleAuthenticationSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$GoogleAuthenticationSuccessImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res,
        _$GoogleAuthenticationSuccessImpl<T>>
    implements _$$GoogleAuthenticationSuccessImplCopyWith<T, $Res> {
  __$$GoogleAuthenticationSuccessImplCopyWithImpl(
      _$GoogleAuthenticationSuccessImpl<T> _value,
      $Res Function(_$GoogleAuthenticationSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GoogleAuthenticationSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$GoogleAuthenticationSuccessImpl<T>
    implements GoogleAuthenticationSuccess<T> {
  const _$GoogleAuthenticationSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'LoginState<$T>.googleAuthenticationSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleAuthenticationSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleAuthenticationSuccessImplCopyWith<T,
          _$GoogleAuthenticationSuccessImpl<T>>
      get copyWith => __$$GoogleAuthenticationSuccessImplCopyWithImpl<T,
          _$GoogleAuthenticationSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function() googleAuthenticationLoading,
    required TResult Function(T data) googleAuthenticationSuccess,
    required TResult Function(ApiErrorModel apiErrorModel)
        googleAuthenticationFailure,
  }) {
    return googleAuthenticationSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function()? googleAuthenticationLoading,
    TResult? Function(T data)? googleAuthenticationSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
  }) {
    return googleAuthenticationSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function()? googleAuthenticationLoading,
    TResult Function(T data)? googleAuthenticationSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (googleAuthenticationSuccess != null) {
      return googleAuthenticationSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) failure,
    required TResult Function(GoogleAuthenticationLoading<T> value)
        googleAuthenticationLoading,
    required TResult Function(GoogleAuthenticationSuccess<T> value)
        googleAuthenticationSuccess,
    required TResult Function(GoogleAuthenticationError<T> value)
        googleAuthenticationFailure,
  }) {
    return googleAuthenticationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? failure,
    TResult? Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult? Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult? Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
  }) {
    return googleAuthenticationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? failure,
    TResult Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (googleAuthenticationSuccess != null) {
      return googleAuthenticationSuccess(this);
    }
    return orElse();
  }
}

abstract class GoogleAuthenticationSuccess<T> implements LoginState<T> {
  const factory GoogleAuthenticationSuccess(final T data) =
      _$GoogleAuthenticationSuccessImpl<T>;

  T get data;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleAuthenticationSuccessImplCopyWith<T,
          _$GoogleAuthenticationSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleAuthenticationErrorImplCopyWith<T, $Res> {
  factory _$$GoogleAuthenticationErrorImplCopyWith(
          _$GoogleAuthenticationErrorImpl<T> value,
          $Res Function(_$GoogleAuthenticationErrorImpl<T>) then) =
      __$$GoogleAuthenticationErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$GoogleAuthenticationErrorImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res,
        _$GoogleAuthenticationErrorImpl<T>>
    implements _$$GoogleAuthenticationErrorImplCopyWith<T, $Res> {
  __$$GoogleAuthenticationErrorImplCopyWithImpl(
      _$GoogleAuthenticationErrorImpl<T> _value,
      $Res Function(_$GoogleAuthenticationErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$GoogleAuthenticationErrorImpl<T>(
      null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$GoogleAuthenticationErrorImpl<T>
    implements GoogleAuthenticationError<T> {
  const _$GoogleAuthenticationErrorImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'LoginState<$T>.googleAuthenticationFailure(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleAuthenticationErrorImpl<T> &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleAuthenticationErrorImplCopyWith<T,
          _$GoogleAuthenticationErrorImpl<T>>
      get copyWith => __$$GoogleAuthenticationErrorImplCopyWithImpl<T,
          _$GoogleAuthenticationErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function() googleAuthenticationLoading,
    required TResult Function(T data) googleAuthenticationSuccess,
    required TResult Function(ApiErrorModel apiErrorModel)
        googleAuthenticationFailure,
  }) {
    return googleAuthenticationFailure(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function()? googleAuthenticationLoading,
    TResult? Function(T data)? googleAuthenticationSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
  }) {
    return googleAuthenticationFailure?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function()? googleAuthenticationLoading,
    TResult Function(T data)? googleAuthenticationSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (googleAuthenticationFailure != null) {
      return googleAuthenticationFailure(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) failure,
    required TResult Function(GoogleAuthenticationLoading<T> value)
        googleAuthenticationLoading,
    required TResult Function(GoogleAuthenticationSuccess<T> value)
        googleAuthenticationSuccess,
    required TResult Function(GoogleAuthenticationError<T> value)
        googleAuthenticationFailure,
  }) {
    return googleAuthenticationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? failure,
    TResult? Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult? Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult? Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
  }) {
    return googleAuthenticationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? failure,
    TResult Function(GoogleAuthenticationLoading<T> value)?
        googleAuthenticationLoading,
    TResult Function(GoogleAuthenticationSuccess<T> value)?
        googleAuthenticationSuccess,
    TResult Function(GoogleAuthenticationError<T> value)?
        googleAuthenticationFailure,
    required TResult orElse(),
  }) {
    if (googleAuthenticationFailure != null) {
      return googleAuthenticationFailure(this);
    }
    return orElse();
  }
}

abstract class GoogleAuthenticationError<T> implements LoginState<T> {
  const factory GoogleAuthenticationError(final ApiErrorModel apiErrorModel) =
      _$GoogleAuthenticationErrorImpl<T>;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleAuthenticationErrorImplCopyWith<T,
          _$GoogleAuthenticationErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
