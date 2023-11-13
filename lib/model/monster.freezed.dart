// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$MonsterCopyWithImpl<$Res, Monster>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$MonsterCopyWithImpl<$Res, $Val extends Monster>
    implements $MonsterCopyWith<$Res> {
  _$MonsterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonsterImplCopyWith<$Res> implements $MonsterCopyWith<$Res> {
  factory _$$MonsterImplCopyWith(
          _$MonsterImpl value, $Res Function(_$MonsterImpl) then) =
      __$$MonsterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$MonsterImplCopyWithImpl<$Res>
    extends _$MonsterCopyWithImpl<$Res, _$MonsterImpl>
    implements _$$MonsterImplCopyWith<$Res> {
  __$$MonsterImplCopyWithImpl(
      _$MonsterImpl _value, $Res Function(_$MonsterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$MonsterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonsterImpl with DiagnosticableTreeMixin implements _Monster {
  const _$MonsterImpl({required this.id, required this.name});

  factory _$MonsterImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonsterImplFromJson(json);

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
            other is _$MonsterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonsterImplCopyWith<_$MonsterImpl> get copyWith =>
      __$$MonsterImplCopyWithImpl<_$MonsterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonsterImplToJson(
      this,
    );
  }
}

abstract class _Monster implements Monster {
  const factory _Monster({required final int id, required final String name}) =
      _$MonsterImpl;

  factory _Monster.fromJson(Map<String, dynamic> json) = _$MonsterImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$MonsterImplCopyWith<_$MonsterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
