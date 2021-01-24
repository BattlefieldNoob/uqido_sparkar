// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sparkar_bloc.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SparkARStateTearOff {
  const _$SparkARStateTearOff();

// ignore: unused_element
  _SparkARValidState valid(List<SparkARUser> networkUserList,
      {List<SparkARUser> filteredUserList,
      int selected = -1,
      String searchKey = ""}) {
    return _SparkARValidState(
      networkUserList,
      filteredUserList: filteredUserList,
      selected: selected,
      searchKey: searchKey,
    );
  }

// ignore: unused_element
  _SparkARLoadingState loading() {
    return _SparkARLoadingState();
  }

// ignore: unused_element
  _SparkARErrorState error() {
    return _SparkARErrorState();
  }
}

/// @nodoc
// ignore: unused_element
const $SparkARState = _$SparkARStateTearOff();

/// @nodoc
mixin _$SparkARState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult valid(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey),
    @required TResult loading(),
    @required TResult error(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult valid(List<SparkARUser> networkUserList,
        List<SparkARUser> filteredUserList, int selected, String searchKey),
    TResult loading(),
    TResult error(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult valid(_SparkARValidState value),
    @required TResult loading(_SparkARLoadingState value),
    @required TResult error(_SparkARErrorState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult valid(_SparkARValidState value),
    TResult loading(_SparkARLoadingState value),
    TResult error(_SparkARErrorState value),
    @required TResult orElse(),
  });
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
    Object networkUserList = freezed,
    Object filteredUserList = freezed,
    Object selected = freezed,
    Object searchKey = freezed,
  }) {
    return _then(_SparkARValidState(
      networkUserList == freezed
          ? _value.networkUserList
          : networkUserList as List<SparkARUser>,
      filteredUserList: filteredUserList == freezed
          ? _value.filteredUserList
          : filteredUserList as List<SparkARUser>,
      selected: selected == freezed ? _value.selected : selected as int,
      searchKey: searchKey == freezed ? _value.searchKey : searchKey as String,
    ));
  }
}

/// @nodoc
class _$_SparkARValidState implements _SparkARValidState {
  _$_SparkARValidState(this.networkUserList,
      {this.filteredUserList, this.selected = -1, this.searchKey = ""})
      : assert(networkUserList != null),
        assert(selected != null),
        assert(searchKey != null);

  @override
  final List<SparkARUser> networkUserList;
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
  TResult when<TResult extends Object>({
    @required
        TResult valid(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey),
    @required TResult loading(),
    @required TResult error(),
  }) {
    assert(valid != null);
    assert(loading != null);
    assert(error != null);
    return valid(networkUserList, filteredUserList, selected, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult valid(List<SparkARUser> networkUserList,
        List<SparkARUser> filteredUserList, int selected, String searchKey),
    TResult loading(),
    TResult error(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (valid != null) {
      return valid(networkUserList, filteredUserList, selected, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult valid(_SparkARValidState value),
    @required TResult loading(_SparkARLoadingState value),
    @required TResult error(_SparkARErrorState value),
  }) {
    assert(valid != null);
    assert(loading != null);
    assert(error != null);
    return valid(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult valid(_SparkARValidState value),
    TResult loading(_SparkARLoadingState value),
    TResult error(_SparkARErrorState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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

  List<SparkARUser> get networkUserList;
  List<SparkARUser> get filteredUserList;
  int get selected;
  String get searchKey;
  @JsonKey(ignore: true)
  _$SparkARValidStateCopyWith<_SparkARValidState> get copyWith;
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
  TResult when<TResult extends Object>({
    @required
        TResult valid(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey),
    @required TResult loading(),
    @required TResult error(),
  }) {
    assert(valid != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult valid(List<SparkARUser> networkUserList,
        List<SparkARUser> filteredUserList, int selected, String searchKey),
    TResult loading(),
    TResult error(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult valid(_SparkARValidState value),
    @required TResult loading(_SparkARLoadingState value),
    @required TResult error(_SparkARErrorState value),
  }) {
    assert(valid != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult valid(_SparkARValidState value),
    TResult loading(_SparkARLoadingState value),
    TResult error(_SparkARErrorState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
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
  TResult when<TResult extends Object>({
    @required
        TResult valid(List<SparkARUser> networkUserList,
            List<SparkARUser> filteredUserList, int selected, String searchKey),
    @required TResult loading(),
    @required TResult error(),
  }) {
    assert(valid != null);
    assert(loading != null);
    assert(error != null);
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult valid(List<SparkARUser> networkUserList,
        List<SparkARUser> filteredUserList, int selected, String searchKey),
    TResult loading(),
    TResult error(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult valid(_SparkARValidState value),
    @required TResult loading(_SparkARLoadingState value),
    @required TResult error(_SparkARErrorState value),
  }) {
    assert(valid != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult valid(_SparkARValidState value),
    TResult loading(_SparkARLoadingState value),
    TResult error(_SparkARErrorState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SparkARErrorState implements SparkARState {
  factory _SparkARErrorState() = _$_SparkARErrorState;
}
