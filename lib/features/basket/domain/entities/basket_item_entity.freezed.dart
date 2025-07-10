// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BasketItemEntity _$BasketItemEntityFromJson(Map<String, dynamic> json) {
  return _BasketItemEntity.fromJson(json);
}

/// @nodoc
mixin _$BasketItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this BasketItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasketItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasketItemEntityCopyWith<BasketItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketItemEntityCopyWith<$Res> {
  factory $BasketItemEntityCopyWith(
          BasketItemEntity value, $Res Function(BasketItemEntity) then) =
      _$BasketItemEntityCopyWithImpl<$Res, BasketItemEntity>;
  @useResult
  $Res call({String id, String name, int quantity});
}

/// @nodoc
class _$BasketItemEntityCopyWithImpl<$Res, $Val extends BasketItemEntity>
    implements $BasketItemEntityCopyWith<$Res> {
  _$BasketItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasketItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasketItemEntityImplCopyWith<$Res>
    implements $BasketItemEntityCopyWith<$Res> {
  factory _$$BasketItemEntityImplCopyWith(_$BasketItemEntityImpl value,
          $Res Function(_$BasketItemEntityImpl) then) =
      __$$BasketItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int quantity});
}

/// @nodoc
class __$$BasketItemEntityImplCopyWithImpl<$Res>
    extends _$BasketItemEntityCopyWithImpl<$Res, _$BasketItemEntityImpl>
    implements _$$BasketItemEntityImplCopyWith<$Res> {
  __$$BasketItemEntityImplCopyWithImpl(_$BasketItemEntityImpl _value,
      $Res Function(_$BasketItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of BasketItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
  }) {
    return _then(_$BasketItemEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasketItemEntityImpl implements _BasketItemEntity {
  const _$BasketItemEntityImpl(
      {required this.id, required this.name, required this.quantity});

  factory _$BasketItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasketItemEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int quantity;

  @override
  String toString() {
    return 'BasketItemEntity(id: $id, name: $name, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, quantity);

  /// Create a copy of BasketItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketItemEntityImplCopyWith<_$BasketItemEntityImpl> get copyWith =>
      __$$BasketItemEntityImplCopyWithImpl<_$BasketItemEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasketItemEntityImplToJson(
      this,
    );
  }
}

abstract class _BasketItemEntity implements BasketItemEntity {
  const factory _BasketItemEntity(
      {required final String id,
      required final String name,
      required final int quantity}) = _$BasketItemEntityImpl;

  factory _BasketItemEntity.fromJson(Map<String, dynamic> json) =
      _$BasketItemEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get quantity;

  /// Create a copy of BasketItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasketItemEntityImplCopyWith<_$BasketItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
