// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() categoryLoading,
    required TResult Function(CategoryResponse categoryResponse)
        categorySuccess,
    required TResult Function(ApiErrorModel apiErrorModel) categoryFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? categoryLoading,
    TResult? Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? categoryFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? categoryLoading,
    TResult Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult Function(ApiErrorModel apiErrorModel)? categoryFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryFailure<T> value) categoryFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryFailure<T> value)? categoryFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryFailure<T> value)? categoryFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<T, $Res> {
  factory $CategoryStateCopyWith(
          CategoryState<T> value, $Res Function(CategoryState<T>) then) =
      _$CategoryStateCopyWithImpl<T, $Res, CategoryState<T>>;
}

/// @nodoc
class _$CategoryStateCopyWithImpl<T, $Res, $Val extends CategoryState<T>>
    implements $CategoryStateCopyWith<T, $Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryState
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
    extends _$CategoryStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CategoryState<$T>.initial()';
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
    required TResult Function() categoryLoading,
    required TResult Function(CategoryResponse categoryResponse)
        categorySuccess,
    required TResult Function(ApiErrorModel apiErrorModel) categoryFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? categoryLoading,
    TResult? Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? categoryFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? categoryLoading,
    TResult Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult Function(ApiErrorModel apiErrorModel)? categoryFailure,
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
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryFailure<T> value) categoryFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryFailure<T> value)? categoryFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryFailure<T> value)? categoryFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements CategoryState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$CategoryLoadingImplCopyWith<T, $Res> {
  factory _$$CategoryLoadingImplCopyWith(_$CategoryLoadingImpl<T> value,
          $Res Function(_$CategoryLoadingImpl<T>) then) =
      __$$CategoryLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CategoryLoadingImplCopyWithImpl<T, $Res>
    extends _$CategoryStateCopyWithImpl<T, $Res, _$CategoryLoadingImpl<T>>
    implements _$$CategoryLoadingImplCopyWith<T, $Res> {
  __$$CategoryLoadingImplCopyWithImpl(_$CategoryLoadingImpl<T> _value,
      $Res Function(_$CategoryLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CategoryLoadingImpl<T> implements CategoryLoading<T> {
  const _$CategoryLoadingImpl();

  @override
  String toString() {
    return 'CategoryState<$T>.categoryLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() categoryLoading,
    required TResult Function(CategoryResponse categoryResponse)
        categorySuccess,
    required TResult Function(ApiErrorModel apiErrorModel) categoryFailure,
  }) {
    return categoryLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? categoryLoading,
    TResult? Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? categoryFailure,
  }) {
    return categoryLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? categoryLoading,
    TResult Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult Function(ApiErrorModel apiErrorModel)? categoryFailure,
    required TResult orElse(),
  }) {
    if (categoryLoading != null) {
      return categoryLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryFailure<T> value) categoryFailure,
  }) {
    return categoryLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryFailure<T> value)? categoryFailure,
  }) {
    return categoryLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryFailure<T> value)? categoryFailure,
    required TResult orElse(),
  }) {
    if (categoryLoading != null) {
      return categoryLoading(this);
    }
    return orElse();
  }
}

abstract class CategoryLoading<T> implements CategoryState<T> {
  const factory CategoryLoading() = _$CategoryLoadingImpl<T>;
}

/// @nodoc
abstract class _$$CategorySuccessImplCopyWith<T, $Res> {
  factory _$$CategorySuccessImplCopyWith(_$CategorySuccessImpl<T> value,
          $Res Function(_$CategorySuccessImpl<T>) then) =
      __$$CategorySuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({CategoryResponse categoryResponse});
}

/// @nodoc
class __$$CategorySuccessImplCopyWithImpl<T, $Res>
    extends _$CategoryStateCopyWithImpl<T, $Res, _$CategorySuccessImpl<T>>
    implements _$$CategorySuccessImplCopyWith<T, $Res> {
  __$$CategorySuccessImplCopyWithImpl(_$CategorySuccessImpl<T> _value,
      $Res Function(_$CategorySuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryResponse = null,
  }) {
    return _then(_$CategorySuccessImpl<T>(
      null == categoryResponse
          ? _value.categoryResponse
          : categoryResponse // ignore: cast_nullable_to_non_nullable
              as CategoryResponse,
    ));
  }
}

/// @nodoc

class _$CategorySuccessImpl<T> implements CategorySuccess<T> {
  const _$CategorySuccessImpl(this.categoryResponse);

  @override
  final CategoryResponse categoryResponse;

  @override
  String toString() {
    return 'CategoryState<$T>.categorySuccess(categoryResponse: $categoryResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySuccessImpl<T> &&
            (identical(other.categoryResponse, categoryResponse) ||
                other.categoryResponse == categoryResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryResponse);

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySuccessImplCopyWith<T, _$CategorySuccessImpl<T>> get copyWith =>
      __$$CategorySuccessImplCopyWithImpl<T, _$CategorySuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() categoryLoading,
    required TResult Function(CategoryResponse categoryResponse)
        categorySuccess,
    required TResult Function(ApiErrorModel apiErrorModel) categoryFailure,
  }) {
    return categorySuccess(categoryResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? categoryLoading,
    TResult? Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? categoryFailure,
  }) {
    return categorySuccess?.call(categoryResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? categoryLoading,
    TResult Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult Function(ApiErrorModel apiErrorModel)? categoryFailure,
    required TResult orElse(),
  }) {
    if (categorySuccess != null) {
      return categorySuccess(categoryResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryFailure<T> value) categoryFailure,
  }) {
    return categorySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryFailure<T> value)? categoryFailure,
  }) {
    return categorySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryFailure<T> value)? categoryFailure,
    required TResult orElse(),
  }) {
    if (categorySuccess != null) {
      return categorySuccess(this);
    }
    return orElse();
  }
}

abstract class CategorySuccess<T> implements CategoryState<T> {
  const factory CategorySuccess(final CategoryResponse categoryResponse) =
      _$CategorySuccessImpl<T>;

  CategoryResponse get categoryResponse;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySuccessImplCopyWith<T, _$CategorySuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryFailureImplCopyWith<T, $Res> {
  factory _$$CategoryFailureImplCopyWith(_$CategoryFailureImpl<T> value,
          $Res Function(_$CategoryFailureImpl<T>) then) =
      __$$CategoryFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$CategoryFailureImplCopyWithImpl<T, $Res>
    extends _$CategoryStateCopyWithImpl<T, $Res, _$CategoryFailureImpl<T>>
    implements _$$CategoryFailureImplCopyWith<T, $Res> {
  __$$CategoryFailureImplCopyWithImpl(_$CategoryFailureImpl<T> _value,
      $Res Function(_$CategoryFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$CategoryFailureImpl<T>(
      null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$CategoryFailureImpl<T> implements CategoryFailure<T> {
  const _$CategoryFailureImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'CategoryState<$T>.categoryFailure(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryFailureImpl<T> &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryFailureImplCopyWith<T, _$CategoryFailureImpl<T>> get copyWith =>
      __$$CategoryFailureImplCopyWithImpl<T, _$CategoryFailureImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() categoryLoading,
    required TResult Function(CategoryResponse categoryResponse)
        categorySuccess,
    required TResult Function(ApiErrorModel apiErrorModel) categoryFailure,
  }) {
    return categoryFailure(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? categoryLoading,
    TResult? Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? categoryFailure,
  }) {
    return categoryFailure?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? categoryLoading,
    TResult Function(CategoryResponse categoryResponse)? categorySuccess,
    TResult Function(ApiErrorModel apiErrorModel)? categoryFailure,
    required TResult orElse(),
  }) {
    if (categoryFailure != null) {
      return categoryFailure(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(CategoryLoading<T> value) categoryLoading,
    required TResult Function(CategorySuccess<T> value) categorySuccess,
    required TResult Function(CategoryFailure<T> value) categoryFailure,
  }) {
    return categoryFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(CategoryLoading<T> value)? categoryLoading,
    TResult? Function(CategorySuccess<T> value)? categorySuccess,
    TResult? Function(CategoryFailure<T> value)? categoryFailure,
  }) {
    return categoryFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(CategoryLoading<T> value)? categoryLoading,
    TResult Function(CategorySuccess<T> value)? categorySuccess,
    TResult Function(CategoryFailure<T> value)? categoryFailure,
    required TResult orElse(),
  }) {
    if (categoryFailure != null) {
      return categoryFailure(this);
    }
    return orElse();
  }
}

abstract class CategoryFailure<T> implements CategoryState<T> {
  const factory CategoryFailure(final ApiErrorModel apiErrorModel) =
      _$CategoryFailureImpl<T>;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryFailureImplCopyWith<T, _$CategoryFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
