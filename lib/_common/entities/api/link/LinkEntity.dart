import 'package:frontend/_common/utils/serzializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generators/LinkEntity.g.dart';

@JsonSerializable()
class LinkEntity implements Serializable {
  final String name;
  final String link;
  final DateTime createdAt;
  final DateTime updatedAt;

  const LinkEntity({
    required this.name,
    required this.link,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LinkEntity.fromJson(Map<String, dynamic> json) => _$LinkEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LinkEntityToJson(this);
}