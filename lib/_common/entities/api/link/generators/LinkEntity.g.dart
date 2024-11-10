// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../LinkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkEntity _$LinkEntityFromJson(Map<String, dynamic> json) => LinkEntity(
      name: json['name'] as String,
      link: json['link'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LinkEntityToJson(LinkEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'link': instance.link,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
