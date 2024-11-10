import 'dart:convert';
import 'dart:typed_data';

import 'package:frontend/_common/entities/api/coin/CoinContentEntity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../utils/serzializable.dart';

part 'generators/CoinEntity.g.dart';

@JsonSerializable()
class CoinEntity implements Serializable {
  final String name;
  final String code;
  final String slug;
  final CoinContentEntity content;

  const CoinEntity({
    required this.name,
    required this.code,
    required this.slug,
    required this.content,
  });

  factory CoinEntity.fromJson(Map<String, dynamic> json) =>
      _$CoinEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CoinEntityToJson(this);

  Uint8List get imageBytes => base64Decode(
        content.files
            .firstWhere((file) => file.extension.extension.contains('png'))
            .data,
      );
}
