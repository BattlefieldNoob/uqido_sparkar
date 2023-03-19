// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageListItem {
  Owner get owner => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Owner owner) header,
    required TResult Function(Effect effect, Owner owner) effect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Owner owner)? header,
    TResult? Function(Effect effect, Owner owner)? effect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Owner owner)? header,
    TResult Function(Effect effect, Owner owner)? effect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Effect value) effect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Effect value)? effect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Effect value)? effect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageListItemCopyWith<HomePageListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageListItemCopyWith<$Res> {
  factory $HomePageListItemCopyWith(
          HomePageListItem value, $Res Function(HomePageListItem) then) =
      _$HomePageListItemCopyWithImpl<$Res, HomePageListItem>;
  @useResult
  $Res call({Owner owner});

  $OwnerCopyWith<$Res> get owner;
}

/// @nodoc
class _$HomePageListItemCopyWithImpl<$Res, $Val extends HomePageListItem>
    implements $HomePageListItemCopyWith<$Res> {
  _$HomePageListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
  }) {
    return _then(_value.copyWith(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res> get owner {
    return $OwnerCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HeaderCopyWith<$Res>
    implements $HomePageListItemCopyWith<$Res> {
  factory _$$_HeaderCopyWith(_$_Header value, $Res Function(_$_Header) then) =
      __$$_HeaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Owner owner});

  @override
  $OwnerCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_HeaderCopyWithImpl<$Res>
    extends _$HomePageListItemCopyWithImpl<$Res, _$_Header>
    implements _$$_HeaderCopyWith<$Res> {
  __$$_HeaderCopyWithImpl(_$_Header _value, $Res Function(_$_Header) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
  }) {
    return _then(_$_Header(
      null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
    ));
  }
}

/// @nodoc

class _$_Header implements _Header {
  _$_Header(this.owner);

  @override
  final Owner owner;

  @override
  String toString() {
    return 'HomePageListItem.header(owner: $owner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Header &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, owner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      __$$_HeaderCopyWithImpl<_$_Header>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Owner owner) header,
    required TResult Function(Effect effect, Owner owner) effect,
  }) {
    return header(owner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Owner owner)? header,
    TResult? Function(Effect effect, Owner owner)? effect,
  }) {
    return header?.call(owner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Owner owner)? header,
    TResult Function(Effect effect, Owner owner)? effect,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(owner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Effect value) effect,
  }) {
    return header(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Effect value)? effect,
  }) {
    return header?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Effect value)? effect,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(this);
    }
    return orElse();
  }
}

abstract class _Header implements HomePageListItem {
  factory _Header(final Owner owner) = _$_Header;

  @override
  Owner get owner;
  @override
  @JsonKey(ignore: true)
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EffectCopyWith<$Res>
    implements $HomePageListItemCopyWith<$Res> {
  factory _$$_EffectCopyWith(_$_Effect value, $Res Function(_$_Effect) then) =
      __$$_EffectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Effect effect, Owner owner});

  $EffectCopyWith<$Res> get effect;
  @override
  $OwnerCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_EffectCopyWithImpl<$Res>
    extends _$HomePageListItemCopyWithImpl<$Res, _$_Effect>
    implements _$$_EffectCopyWith<$Res> {
  __$$_EffectCopyWithImpl(_$_Effect _value, $Res Function(_$_Effect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effect = null,
    Object? owner = null,
  }) {
    return _then(_$_Effect(
      null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as Effect,
      null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EffectCopyWith<$Res> get effect {
    return $EffectCopyWith<$Res>(_value.effect, (value) {
      return _then(_value.copyWith(effect: value));
    });
  }
}

/// @nodoc

class _$_Effect implements _Effect {
  _$_Effect(this.effect, this.owner);

  @override
  final Effect effect;
  @override
  final Owner owner;

  @override
  String toString() {
    return 'HomePageListItem.effect(effect: $effect, owner: $owner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Effect &&
            (identical(other.effect, effect) || other.effect == effect) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, effect, owner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EffectCopyWith<_$_Effect> get copyWith =>
      __$$_EffectCopyWithImpl<_$_Effect>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Owner owner) header,
    required TResult Function(Effect effect, Owner owner) effect,
  }) {
    return effect(this.effect, owner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Owner owner)? header,
    TResult? Function(Effect effect, Owner owner)? effect,
  }) {
    return effect?.call(this.effect, owner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Owner owner)? header,
    TResult Function(Effect effect, Owner owner)? effect,
    required TResult orElse(),
  }) {
    if (effect != null) {
      return effect(this.effect, owner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Header value) header,
    required TResult Function(_Effect value) effect,
  }) {
    return effect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Header value)? header,
    TResult? Function(_Effect value)? effect,
  }) {
    return effect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Header value)? header,
    TResult Function(_Effect value)? effect,
    required TResult orElse(),
  }) {
    if (effect != null) {
      return effect(this);
    }
    return orElse();
  }
}

abstract class _Effect implements HomePageListItem {
  factory _Effect(final Effect effect, final Owner owner) = _$_Effect;

  Effect get effect;
  @override
  Owner get owner;
  @override
  @JsonKey(ignore: true)
  _$$_EffectCopyWith<_$_Effect> get copyWith =>
      throw _privateConstructorUsedError;
}
