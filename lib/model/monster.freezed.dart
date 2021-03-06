// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'monster.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Monster _$MonsterFromJson(Map<String, dynamic> json) {
  return _Monster.fromJson(json);
}

/// @nodoc
mixin _$Monster {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonsterCopyWith<Monster> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonsterCopyWith<$Res> {
  factory $MonsterCopyWith(Monster value, $Res Function(Monster) then) =
      _$MonsterCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$MonsterCopyWithImpl<$Res> implements $MonsterCopyWith<$Res> {
  _$MonsterCopyWithImpl(this._value, this._then);

  final Monster _value;
  // ignore: unused_field
  final $Res Function(Monster) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MonsterCopyWith<$Res> implements $MonsterCopyWith<$Res> {
  factory _$$_MonsterCopyWith(
          _$_Monster value, $Res Function(_$_Monster) then) =
      __$$_MonsterCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$$_MonsterCopyWithImpl<$Res> extends _$MonsterCopyWithImpl<$Res>
    implements _$$_MonsterCopyWith<$Res> {
  __$$_MonsterCopyWithImpl(_$_Monster _value, $Res Function(_$_Monster) _then)
      : super(_value, (v) => _then(v as _$_Monster));

  @override
  _$_Monster get _value => super._value as _$_Monster;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Monster(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Monster with DiagnosticableTreeMixin implements _Monster {
  const _$_Monster({required this.id, required this.name});

  factory _$_Monster.fromJson(Map<String, dynamic> json) =>
      _$$_MonsterFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Monster(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Monster'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Monster &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_MonsterCopyWith<_$_Monster> get copyWith =>
      __$$_MonsterCopyWithImpl<_$_Monster>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MonsterToJson(this);
  }
}

abstract class _Monster implements Monster {
  const factory _Monster({required final int id, required final String name}) =
      _$_Monster;

  factory _Monster.fromJson(Map<String, dynamic> json) = _$_Monster.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MonsterCopyWith<_$_Monster> get copyWith =>
      throw _privateConstructorUsedError;
}
