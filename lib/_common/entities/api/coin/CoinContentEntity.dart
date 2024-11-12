import 'package:frontend/_common/entities/api/file/FileEntity.dart';
import 'package:frontend/_common/entities/api/link/LinkEntity.dart';
import 'package:frontend/_common/utils/serzializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generators/CoinContentEntity.g.dart';

@JsonSerializable()
class CoinContentEntity implements Serializable {
  final List<LinkEntity> links;
  final List<FileEntity> files;

  const CoinContentEntity({
    required this.links,
    required this.files,
  });

  factory CoinContentEntity.fromJson(Map<String, dynamic> json) =>
      _$CoinContentEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CoinContentEntityToJson(this);
}
