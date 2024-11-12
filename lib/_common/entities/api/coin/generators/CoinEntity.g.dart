// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../CoinEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinEntity _$CoinEntityFromJson(Map<String, dynamic> json) => CoinEntity(
      id: json['_id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      slug: json['slug'] as String,
      content:
          CoinContentEntity.fromJson(json['content'] as Map<String, dynamic>),
      prices: (json['prices'] as List<dynamic>)
          .map((e) => CoinPriceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoinEntityToJson(CoinEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'slug': instance.slug,
      'content': instance.content,
      'prices': instance.prices,
    };
