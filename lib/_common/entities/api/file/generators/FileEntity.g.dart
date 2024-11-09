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
      mimeType:
          FileMimeTypeEntity.fromJson(json['mimeType'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$FileEntityToJson(FileEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'data': instance.data,
      'mimeType': instance.mimeType,
      'extension': instance.extension,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
