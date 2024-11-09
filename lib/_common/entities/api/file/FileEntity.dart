import 'package:frontend/_common/entities/api/file/FileExtensionEntity.dart';
import 'package:frontend/_common/entities/api/file/FileMimeTypeEntity.dart';
import 'package:frontend/_common/utils/serzializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generators/FileEntity.g.dart';

@JsonSerializable()
class FileEntity implements Serializable {
  final String name;
  final int size;
  final String data;
  final FileMimeTypeEntity mimeType;
  final FileExtensionEntity extension;
  final DateTime createdAt;
  final DateTime updatedAt;

  const FileEntity({
    required this.name,
    required this.size,
    required this.data,
    required this.extension,
    required this.mimeType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FileEntity.fromJson(Map<String, dynamic> json) => _$FileEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FileEntityToJson(this);
}