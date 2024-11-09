import 'package:frontend/_common/entities/api/coin/CoinContentEntity.dart';
import 'package:frontend/_common/entities/api/coin/CoinPriceEntity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../utils/serzializable.dart';

part 'generators/CoinEntity.g.dart';

@JsonSerializable()
class CoinEntity implements Serializable {
  final String name;
  final String code;
  final String slug;
  final CoinContentEntity content;
  final List<CoinPriceEntity> prices;

  const CoinEntity({
    required this.name,
    required this.code,
    required this.slug,
    required this.content,
    required this.prices,
  });

  factory CoinEntity.fromJson(Map<String, dynamic> json) => _$CoinEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CoinEntityToJson(this);
}