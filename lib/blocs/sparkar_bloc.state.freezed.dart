// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sparkar_bloc.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SparkARStateTearOff {
  const _$SparkARStateTearOff();

  _SparkARValidState valid(List<SparkARUser> networkUserList,
      {List<SparkARUser> filteredUserList = const [],
      int selected = -1,
      String searchKey = ""}) {
    return _SparkARValidState(
      networkUserList,
      filteredUserList: filteredUserList,
      selected: selected,
      searchKey: searchKey,
    );
  }

  _SparkARLoadingState loading() {
    return _SparkARLoadingState();
  }

  _SparkARErrorState error() {
    return _SparkARErrorState();
  }

  _SparkARLogoutState logout() {
    return _SparkARLogoutState();
  }
}

/// @nodoc
const $SparkARState = _$SparkARStateTearOff();

/// @nodoc
mixin _$SparkARState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)
        valid,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)?
        valid,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SparkARValidState value) valid,
    required TResult Function(_SparkARLoadingState value) loading,
    required TResult Function(_SparkARErrorState value) error,
    required TResult Function(_SparkARLogoutState value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SparkARValidState value)? valid,
    TResult Function(_SparkARLoadingState value)? loading,
    TResult Function(_SparkARErrorState value)? error,
    TResult Function(_SparkARLogoutState value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SparkARStateCopyWith<$Res> {
  factory $SparkARStateCopyWith(
          SparkARState value, $Res Function(SparkARState) then) =
      _$SparkARStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SparkARStateCopyWithImpl<$Res> implements $SparkARStateCopyWith<$Res> {
  _$SparkARStateCopyWithImpl(this._value, this._then);

  final SparkARState _value;
  // ignore: unused_field
  final $Res Function(SparkARState) _then;
}

/// @nodoc
abstract class _$SparkARValidStateCopyWith<$Res> {
  factory _$SparkARValidStateCopyWith(
          _SparkARValidState value, $Res Function(_SparkARValidState) then) =
      __$SparkARValidStateCopyWithImpl<$Res>;
  $Res call(
      {List<SparkARUser> networkUserList,
      List<SparkARUser> filteredUserList,
      int selected,
      String searchKey});
}

/// @nodoc
class __$SparkARValidStateCopyWithImpl<$Res>
    extends _$SparkARStateCopyWithImpl<$Res>
    implements _$SparkARValidStateCopyWith<$Res> {
  __$SparkARValidStateCopyWithImpl(
      _SparkARValidState _value, $Res Function(_SparkARValidState) _then)
      : super(_value, (v) => _then(v as _SparkARValidState));

  @override
  _SparkARValidState get _value => super._value as _SparkARValidState;

  @override
  $Res call({
    Object? networkUserList = freezed,
    Object? filteredUserList = freezed,
    Object? selected = freezed,
    Object? searchKey = freezed,
  }) {
    return _then(_SparkARValidState(
      networkUserList == freezed
          ? _value.networkUserList
          : networkUserList // ignore: cast_nullable_to_non_nullable
              as List<SparkARUser>,
      filteredUserList: filteredUserList == freezed
          ? _value.filteredUserList
          : filteredUserList // ignore: cast_nullable_to_non_nullable
              as List<SparkARUser>,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
      searchKey: searchKey == freezed
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_SparkARValidState implements _SparkARValidState {
  _$_SparkARValidState(this.networkUserList,
      {this.filteredUserList = const [],
      this.selected = -1,
      this.searchKey = ""});

  @override
  final List<SparkARUser> networkUserList;
  @JsonKey(defaultValue: const [])
  @override
  final List<SparkARUser> filteredUserList;
  @JsonKey(defaultValue: -1)
  @override
  final int selected;
  @JsonKey(defaultValue: "")
  @override
  final String searchKey;

  @override
  String toString() {
    return 'SparkARState.valid(networkUserList: $networkUserList, filteredUserList: $filteredUserList, selected: $selected, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SparkARValidState &&
            (identical(other.networkUserList, networkUserList) ||
                const DeepCollectionEquality()
                    .equals(other.networkUserList, networkUserList)) &&
            (identical(other.filteredUserList, filteredUserList) ||
                const DeepCollectionEquality()
                    .equals(other.filteredUserList, filteredUserList)) &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)) &&
            (identical(other.searchKey, searchKey) ||
                const DeepCollectionEquality()
                    .equals(other.searchKey, searchKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(networkUserList) ^
      const DeepCollectionEquality().hash(filteredUserList) ^
      const DeepCollectionEquality().hash(selected) ^
      const DeepCollectionEquality().hash(searchKey);

  @JsonKey(ignore: true)
  @override
  _$SparkARValidStateCopyWith<_SparkARValidState> get copyWith =>
      __$SparkARValidStateCopyWithImpl<_SparkARValidState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)
        valid,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() logout,
  }) {
    return valid(networkUserList, filteredUserList, selected, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)?
        valid,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(networkUserList, filteredUserList, selected, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SparkARValidState value) valid,
    required TResult Function(_SparkARLoadingState value) loading,
    required TResult Function(_SparkARErrorState value) error,
    required TResult Function(_SparkARLogoutState value) logout,
  }) {
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SparkARValidState value)? valid,
    TResult Function(_SparkARLoadingState value)? loading,
    TResult Function(_SparkARErrorState value)? error,
    TResult Function(_SparkARLogoutState value)? logout,
    required TResult orElse(),
  }) {
    if (valid != null) {
      return valid(this);
    }
    return orElse();
  }
}

abstract class _SparkARValidState implements SparkARState {
  factory _SparkARValidState(List<SparkARUser> networkUserList,
      {List<SparkARUser> filteredUserList,
      int selected,
      String searchKey}) = _$_SparkARValidState;

  List<SparkARUser> get networkUserList => throw _privateConstructorUsedError;
  List<SparkARUser> get filteredUserList => throw _privateConstructorUsedError;
  int get selected => throw _privateConstructorUsedError;
  String get searchKey => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SparkARValidStateCopyWith<_SparkARValidState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SparkARLoadingStateCopyWith<$Res> {
  factory _$SparkARLoadingStateCopyWith(_SparkARLoadingState value,
          $Res Function(_SparkARLoadingState) then) =
      __$SparkARLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$SparkARLoadingStateCopyWithImpl<$Res>
    extends _$SparkARStateCopyWithImpl<$Res>
    implements _$SparkARLoadingStateCopyWith<$Res> {
  __$SparkARLoadingStateCopyWithImpl(
      _SparkARLoadingState _value, $Res Function(_SparkARLoadingState) _then)
      : super(_value, (v) => _then(v as _SparkARLoadingState));

  @override
  _SparkARLoadingState get _value => super._value as _SparkARLoadingState;
}

/// @nodoc
class _$_SparkARLoadingState implements _SparkARLoadingState {
  _$_SparkARLoadingState();

  @override
  String toString() {
    return 'SparkARState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SparkARLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)
        valid,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() logout,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)?
        valid,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? logout,
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
    required TResult Function(_SparkARValidState value) valid,
    required TResult Function(_SparkARLoadingState value) loading,
    required TResult Function(_SparkARErrorState value) error,
    required TResult Function(_SparkARLogoutState value) logout,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SparkARValidState value)? valid,
    TResult Function(_SparkARLoadingState value)? loading,
    TResult Function(_SparkARErrorState value)? error,
    TResult Function(_SparkARLogoutState value)? logout,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SparkARLoadingState implements SparkARState {
  factory _SparkARLoadingState() = _$_SparkARLoadingState;
}

/// @nodoc
abstract class _$SparkARErrorStateCopyWith<$Res> {
  factory _$SparkARErrorStateCopyWith(
          _SparkARErrorState value, $Res Function(_SparkARErrorState) then) =
      __$SparkARErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$SparkARErrorStateCopyWithImpl<$Res>
    extends _$SparkARStateCopyWithImpl<$Res>
    implements _$SparkARErrorStateCopyWith<$Res> {
  __$SparkARErrorStateCopyWithImpl(
      _SparkARErrorState _value, $Res Function(_SparkARErrorState) _then)
      : super(_value, (v) => _then(v as _SparkARErrorState));

  @override
  _SparkARErrorState get _value => super._value as _SparkARErrorState;
}

/// @nodoc
class _$_SparkARErrorState implements _SparkARErrorState {
  _$_SparkARErrorState();

  @override
  String toString() {
    return 'SparkARState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SparkARErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)
        valid,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() logout,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)?
        valid,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SparkARValidState value) valid,
    required TResult Function(_SparkARLoadingState value) loading,
    required TResult Function(_SparkARErrorState value) error,
    required TResult Function(_SparkARLogoutState value) logout,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SparkARValidState value)? valid,
    TResult Function(_SparkARLoadingState value)? loading,
    TResult Function(_SparkARErrorState value)? error,
    TResult Function(_SparkARLogoutState value)? logout,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SparkARErrorState implements SparkARState {
  factory _SparkARErrorState() = _$_SparkARErrorState;
}

/// @nodoc
abstract class _$SparkARLogoutStateCopyWith<$Res> {
  factory _$SparkARLogoutStateCopyWith(
          _SparkARLogoutState value, $Res Function(_SparkARLogoutState) then) =
      __$SparkARLogoutStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$SparkARLogoutStateCopyWithImpl<$Res>
    extends _$SparkARStateCopyWithImpl<$Res>
    implements _$SparkARLogoutStateCopyWith<$Res> {
  __$SparkARLogoutStateCopyWithImpl(
      _SparkARLogoutState _value, $Res Function(_SparkARLogoutState) _then)
      : super(_value, (v) => _then(v as _SparkARLogoutState));

  @override
  _SparkARLogoutState get _value => super._value as _SparkARLogoutState;
}

/// @nodoc
class _$_SparkARLogoutState implements _SparkARLogoutState {
  _$_SparkARLogoutState();

  @override
  String toString() {
    return 'SparkARState.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SparkARLogoutState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)
        valid,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey)?
        valid,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SparkARValidState value) valid,
    required TResult Function(_SparkARLoadingState value) loading,
    required TResult Function(_SparkARErrorState value) error,
    required TResult Function(_SparkARLogoutState value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SparkARValidState value)? valid,
    TResult Function(_SparkARLoadingState value)? loading,
    TResult Function(_SparkARErrorState value)? error,
    TResult Function(_SparkARLogoutState value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _SparkARLogoutState implements SparkARState {
  factory _SparkARLogoutState() = _$_SparkARLogoutState;
}
