// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../CoinPriceEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinPriceEntity _$CoinPriceEntityFromJson(Map<String, dynamic> json) =>
    CoinPriceEntity(
      price: (json['price'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
      marketCap: (json['marketCap'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$CoinPriceEntityToJson(CoinPriceEntity instance) =>
    <String, dynamic>{
      'price': instance.price,
      'volume': instance.volume,
      'marketCap': instance.marketCap,
      'date': instance.date.toIso8601String(),
    };
