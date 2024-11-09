// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../CoinContentEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinContentEntity _$CoinContentEntityFromJson(Map<String, dynamic> json) =>
    CoinContentEntity(
      links: (json['links'] as List<dynamic>)
          .map((e) => LinkEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['files'] as List<dynamic>)
          .map((e) => FileEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoinContentEntityToJson(CoinContentEntity instance) =>
    <String, dynamic>{
      'links': instance.links,
      'files': instance.files,
    };
