// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pageable<T> _$PageableFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Pageable<T>(
      _$nullableGenericFromJson(json['content'], fromJsonT),
      json['last'] as bool? ?? true,
      json['totalPages'] as int,
      json['totalElements'] as int,
      json['first'] as bool? ?? true,
      json['size'] as int,
      json['number'] as int,
      json['numberOfElements'] as int,
      json['empty'] as bool? ?? true,
      Sort.fromJson(json['sort'] as Map<String, dynamic>),
      PageableData.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PageableToJson<T>(
  Pageable<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'first': instance.first,
      'size': instance.size,
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
      'sort': Sort.toJsonStatic(instance.sort),
      'pageable': PageableData.toJsonStatic(instance.pageable),
      'content': _$nullableGenericToJson(instance.content, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
