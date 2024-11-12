import 'package:frontend/_common/utils/serzializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generators/CoinPriceEntity.g.dart';

@JsonSerializable()
class CoinPriceEntity implements Serializable {
  final double price;
  final double volume;
  final double marketCap;
  final DateTime date;

  const CoinPriceEntity({
    required this.price,
    required this.volume,
    required this.marketCap,
    required this.date,
  });

  factory CoinPriceEntity.fromJson(Map<String, dynamic> json) =>
      _$CoinPriceEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CoinPriceEntityToJson(this);
}
