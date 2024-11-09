import 'package:frontend/_common/utils/serzializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generators/FileMimeTypeEntity.g.dart';


@JsonSerializable()
class FileMimeTypeEntity implements Serializable {
  final String type;

   const FileMimeTypeEntity({
    required this.type
  });

  factory FileMimeTypeEntity.fromJson(Map<String, dynamic> json) => _$FileMimeTypeEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FileMimeTypeEntityToJson(this);
}