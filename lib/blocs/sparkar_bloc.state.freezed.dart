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
  _SparkARState call(
      List<SparkARUser> networkUserList,
      List<SparkARUser> filteredUserList,
      int selected,
      bool isLoading,
      String searchKey) {
    return _SparkARState(
      networkUserList,
      filteredUserList,
      selected,
      isLoading,
      searchKey,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SparkARState = _$SparkARStateTearOff();

/// @nodoc
mixin _$SparkARState {
  List<SparkARUser> get networkUserList;
  List<SparkARUser> get filteredUserList;
  int get selected;
  bool get isLoading;
  String get searchKey;

  @JsonKey(ignore: true)
  $SparkARStateCopyWith<SparkARState> get copyWith;
}

/// @nodoc
abstract class $SparkARStateCopyWith<$Res> {
  factory $SparkARStateCopyWith(
          SparkARState value, $Res Function(SparkARState) then) =
      _$SparkARStateCopyWithImpl<$Res>;
  $Res call(
      {List<SparkARUser> networkUserList,
      List<SparkARUser> filteredUserList,
      int selected,
      bool isLoading,
      String searchKey});
}

/// @nodoc
class _$SparkARStateCopyWithImpl<$Res> implements $SparkARStateCopyWith<$Res> {
  _$SparkARStateCopyWithImpl(this._value, this._then);

  final SparkARState _value;
  // ignore: unused_field
  final $Res Function(SparkARState) _then;

  @override
  $Res call({
    Object networkUserList = freezed,
    Object filteredUserList = freezed,
    Object selected = freezed,
    Object isLoading = freezed,
    Object searchKey = freezed,
  }) {
    return _then(_value.copyWith(
      networkUserList: networkUserList == freezed
          ? _value.networkUserList
          : networkUserList as List<SparkARUser>,
      filteredUserList: filteredUserList == freezed
          ? _value.filteredUserList
          : filteredUserList as List<SparkARUser>,
      selected: selected == freezed ? _value.selected : selected as int,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      searchKey: searchKey == freezed ? _value.searchKey : searchKey as String,
    ));
  }
}

/// @nodoc
abstract class _$SparkARStateCopyWith<$Res>
    implements $SparkARStateCopyWith<$Res> {
  factory _$SparkARStateCopyWith(
          _SparkARState value, $Res Function(_SparkARState) then) =
      __$SparkARStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SparkARUser> networkUserList,
      List<SparkARUser> filteredUserList,
      int selected,
      bool isLoading,
      String searchKey});
}

/// @nodoc
class __$SparkARStateCopyWithImpl<$Res> extends _$SparkARStateCopyWithImpl<$Res>
    implements _$SparkARStateCopyWith<$Res> {
  __$SparkARStateCopyWithImpl(
      _SparkARState _value, $Res Function(_SparkARState) _then)
      : super(_value, (v) => _then(v as _SparkARState));

  @override
  _SparkARState get _value => super._value as _SparkARState;

  @override
  $Res call({
    Object networkUserList = freezed,
    Object filteredUserList = freezed,
    Object selected = freezed,
    Object isLoading = freezed,
    Object searchKey = freezed,
  }) {
    return _then(_SparkARState(
      networkUserList == freezed
          ? _value.networkUserList
          : networkUserList as List<SparkARUser>,
      filteredUserList == freezed
          ? _value.filteredUserList
          : filteredUserList as List<SparkARUser>,
      selected == freezed ? _value.selected : selected as int,
      isLoading == freezed ? _value.isLoading : isLoading as bool,
      searchKey == freezed ? _value.searchKey : searchKey as String,
    ));
  }
}

/// @nodoc
class _$_SparkARState extends _SparkARState {
  _$_SparkARState(this.networkUserList, this.filteredUserList, this.selected,
      this.isLoading, this.searchKey)
      : assert(networkUserList != null),
        assert(filteredUserList != null),
        assert(selected != null),
        assert(isLoading != null),
        assert(searchKey != null),
        super._();

  @override
  final List<SparkARUser> networkUserList;
  @override
  final List<SparkARUser> filteredUserList;
  @override
  final int selected;
  @override
  final bool isLoading;
  @override
  final String searchKey;

  @override
  String toString() {
    return 'SparkARState(networkUserList: $networkUserList, filteredUserList: $filteredUserList, selected: $selected, isLoading: $isLoading, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SparkARState &&
            (identical(other.networkUserList, networkUserList) ||
                const DeepCollectionEquality()
                    .equals(other.networkUserList, networkUserList)) &&
            (identical(other.filteredUserList, filteredUserList) ||
                const DeepCollectionEquality()
                    .equals(other.filteredUserList, filteredUserList)) &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
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
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(searchKey);

  @JsonKey(ignore: true)
  @override
  _$SparkARStateCopyWith<_SparkARState> get copyWith =>
      __$SparkARStateCopyWithImpl<_SparkARState>(this, _$identity);
}

abstract class _SparkARState extends SparkARState {
  _SparkARState._() : super._();
  factory _SparkARState(
      List<SparkARUser> networkUserList,
      List<SparkARUser> filteredUserList,
      int selected,
      bool isLoading,
      String searchKey) = _$_SparkARState;

  @override
  List<SparkARUser> get networkUserList;
  @override
  List<SparkARUser> get filteredUserList;
  @override
  int get selected;
  @override
  bool get isLoading;
  @override
  String get searchKey;
  @override
  @JsonKey(ignore: true)
  _$SparkARStateCopyWith<_SparkARState> get copyWith;
}
