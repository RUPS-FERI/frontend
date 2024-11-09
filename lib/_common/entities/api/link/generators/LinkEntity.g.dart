// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../LinkEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkEntity _$LinkEntityFromJson(Map<String, dynamic> json) => LinkEntity(
      name: json['name'] as String,
      link: json['link'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$LinkEntityToJson(LinkEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'link': instance.link,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
