import 'package:frontend/_common/utils/serzializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generators/FileExtensionEntity.g.dart';

@JsonSerializable()
class FileExtensionEntity implements Serializable {
  final String extension;

  const FileExtensionEntity({required this.extension});

  factory FileExtensionEntity.fromJson(Map<String, dynamic> json) =>
      _$FileExtensionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FileExtensionEntityToJson(this);
}
