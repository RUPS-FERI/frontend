// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../CoinEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinEntity _$CoinEntityFromJson(Map<String, dynamic> json) => CoinEntity(
      name: json['name'] as String,
      code: json['code'] as String,
      slug: json['slug'] as String,
      content:
          CoinContentEntity.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinEntityToJson(CoinEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'slug': instance.slug,
      'content': instance.content,
    };
