// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../FileEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileEntity _$FileEntityFromJson(Map<String, dynamic> json) => FileEntity(
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      data: json['data'] as String,
      extension: FileExtensionEntity.fromJson(
          json['extension'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$FileEntityToJson(FileEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'data': instance.data,
      'extension': instance.extension,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
