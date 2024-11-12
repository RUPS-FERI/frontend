import 'dart:convert';
import 'dart:typed_data';

import 'package:frontend/_common/entities/api/coin/CoinContentEntity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../utils/serzializable.dart';
import 'CoinPriceEntity.dart';

part 'generators/CoinEntity.g.dart';

@JsonSerializable()
class CoinEntity implements Serializable {
  final String id;
  final String name;
  final String code;
  final String slug;
  final CoinContentEntity content;
  final List<CoinPriceEntity> prices;

  const CoinEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.slug,
    required this.content,
    required this.prices,
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

  double get price => prices.last.price;

  double get volume => prices.last.price;

  double get marketCap => prices.last.marketCap;
}
