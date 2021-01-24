// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sparkar_bloc.actions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SparkARActionTearOff {
  const _$SparkARActionTearOff();

// ignore: unused_element
  _UpdateAction update() {
    return const _UpdateAction();
  }

// ignore: unused_element
  _SelectAction selectUser(int selectedUser) {
    return _SelectAction(
      selectedUser,
    );
  }

// ignore: unused_element
  _SearchAction search(String keyword) {
    return _SearchAction(
      keyword,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SparkARAction = _$SparkARActionTearOff();

/// @nodoc
mixin _$SparkARAction {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult update(),
    @required TResult selectUser(int selectedUser),
    @required TResult search(String keyword),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult update(),
    TResult selectUser(int selectedUser),
    TResult search(String keyword),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult update(_UpdateAction value),
    @required TResult selectUser(_SelectAction value),
    @required TResult search(_SearchAction value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult update(_UpdateAction value),
    TResult selectUser(_SelectAction value),
    TResult search(_SearchAction value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SparkARActionCopyWith<$Res> {
  factory $SparkARActionCopyWith(
          SparkARAction value, $Res Function(SparkARAction) then) =
      _$SparkARActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$SparkARActionCopyWithImpl<$Res>
    implements $SparkARActionCopyWith<$Res> {
  _$SparkARActionCopyWithImpl(this._value, this._then);

  final SparkARAction _value;
  // ignore: unused_field
  final $Res Function(SparkARAction) _then;
}

/// @nodoc
abstract class _$UpdateActionCopyWith<$Res> {
  factory _$UpdateActionCopyWith(
          _UpdateAction value, $Res Function(_UpdateAction) then) =
      __$UpdateActionCopyWithImpl<$Res>;
}

/// @nodoc
class __$UpdateActionCopyWithImpl<$Res>
    extends _$SparkARActionCopyWithImpl<$Res>
    implements _$UpdateActionCopyWith<$Res> {
  __$UpdateActionCopyWithImpl(
      _UpdateAction _value, $Res Function(_UpdateAction) _then)
      : super(_value, (v) => _then(v as _UpdateAction));

  @override
  _UpdateAction get _value => super._value as _UpdateAction;
}

/// @nodoc
class _$_UpdateAction implements _UpdateAction {
  const _$_UpdateAction();

  @override
  String toString() {
    return 'SparkARAction.update()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UpdateAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult update(),
    @required TResult selectUser(int selectedUser),
    @required TResult search(String keyword),
  }) {
    assert(update != null);
    assert(selectUser != null);
    assert(search != null);
    return update();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult update(),
    TResult selectUser(int selectedUser),
    TResult search(String keyword),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult update(_UpdateAction value),
    @required TResult selectUser(_SelectAction value),
    @required TResult search(_SearchAction value),
  }) {
    assert(update != null);
    assert(selectUser != null);
    assert(search != null);
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult update(_UpdateAction value),
    TResult selectUser(_SelectAction value),
    TResult search(_SearchAction value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _UpdateAction implements SparkARAction {
  const factory _UpdateAction() = _$_UpdateAction;
}

/// @nodoc
abstract class _$SelectActionCopyWith<$Res> {
  factory _$SelectActionCopyWith(
          _SelectAction value, $Res Function(_SelectAction) then) =
      __$SelectActionCopyWithImpl<$Res>;
  $Res call({int selectedUser});
}

/// @nodoc
class __$SelectActionCopyWithImpl<$Res>
    extends _$SparkARActionCopyWithImpl<$Res>
    implements _$SelectActionCopyWith<$Res> {
  __$SelectActionCopyWithImpl(
      _SelectAction _value, $Res Function(_SelectAction) _then)
      : super(_value, (v) => _then(v as _SelectAction));

  @override
  _SelectAction get _value => super._value as _SelectAction;

  @override
  $Res call({
    Object selectedUser = freezed,
  }) {
    return _then(_SelectAction(
      selectedUser == freezed ? _value.selectedUser : selectedUser as int,
    ));
  }
}

/// @nodoc
class _$_SelectAction implements _SelectAction {
  const _$_SelectAction(this.selectedUser) : assert(selectedUser != null);

  @override
  final int selectedUser;

  @override
  String toString() {
    return 'SparkARAction.selectUser(selectedUser: $selectedUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelectAction &&
            (identical(other.selectedUser, selectedUser) ||
                const DeepCollectionEquality()
                    .equals(other.selectedUser, selectedUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selectedUser);

  @JsonKey(ignore: true)
  @override
  _$SelectActionCopyWith<_SelectAction> get copyWith =>
      __$SelectActionCopyWithImpl<_SelectAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult update(),
    @required TResult selectUser(int selectedUser),
    @required TResult search(String keyword),
  }) {
    assert(update != null);
    assert(selectUser != null);
    assert(search != null);
    return selectUser(selectedUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult update(),
    TResult selectUser(int selectedUser),
    TResult search(String keyword),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectUser != null) {
      return selectUser(selectedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult update(_UpdateAction value),
    @required TResult selectUser(_SelectAction value),
    @required TResult search(_SearchAction value),
  }) {
    assert(update != null);
    assert(selectUser != null);
    assert(search != null);
    return selectUser(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult update(_UpdateAction value),
    TResult selectUser(_SelectAction value),
    TResult search(_SearchAction value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectUser != null) {
      return selectUser(this);
    }
    return orElse();
  }
}

abstract class _SelectAction implements SparkARAction {
  const factory _SelectAction(int selectedUser) = _$_SelectAction;

  int get selectedUser;
  @JsonKey(ignore: true)
  _$SelectActionCopyWith<_SelectAction> get copyWith;
}

/// @nodoc
abstract class _$SearchActionCopyWith<$Res> {
  factory _$SearchActionCopyWith(
          _SearchAction value, $Res Function(_SearchAction) then) =
      __$SearchActionCopyWithImpl<$Res>;
  $Res call({String keyword});
}

/// @nodoc
class __$SearchActionCopyWithImpl<$Res>
    extends _$SparkARActionCopyWithImpl<$Res>
    implements _$SearchActionCopyWith<$Res> {
  __$SearchActionCopyWithImpl(
      _SearchAction _value, $Res Function(_SearchAction) _then)
      : super(_value, (v) => _then(v as _SearchAction));

  @override
  _SearchAction get _value => super._value as _SearchAction;

  @override
  $Res call({
    Object keyword = freezed,
  }) {
    return _then(_SearchAction(
      keyword == freezed ? _value.keyword : keyword as String,
    ));
  }
}

/// @nodoc
class _$_SearchAction implements _SearchAction {
  const _$_SearchAction(this.keyword) : assert(keyword != null);

  @override
  final String keyword;

  @override
  String toString() {
    return 'SparkARAction.search(keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchAction &&
            (identical(other.keyword, keyword) ||
                const DeepCollectionEquality().equals(other.keyword, keyword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(keyword);

  @JsonKey(ignore: true)
  @override
  _$SearchActionCopyWith<_SearchAction> get copyWith =>
      __$SearchActionCopyWithImpl<_SearchAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult update(),
    @required TResult selectUser(int selectedUser),
    @required TResult search(String keyword),
  }) {
    assert(update != null);
    assert(selectUser != null);
    assert(search != null);
    return search(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult update(),
    TResult selectUser(int selectedUser),
    TResult search(String keyword),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (search != null) {
      return search(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult update(_UpdateAction value),
    @required TResult selectUser(_SelectAction value),
    @required TResult search(_SearchAction value),
  }) {
    assert(update != null);
    assert(selectUser != null);
    assert(search != null);
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult update(_UpdateAction value),
    TResult selectUser(_SelectAction value),
    TResult search(_SearchAction value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _SearchAction implements SparkARAction {
  const factory _SearchAction(String keyword) = _$_SearchAction;

  String get keyword;
  @JsonKey(ignore: true)
  _$SearchActionCopyWith<_SearchAction> get copyWith;
}
