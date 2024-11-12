import 'package:frontend/_common/entities/api/coin/CoinEntity.dart';

import '../entities/pagination-data.model.dart';
import '../utils/model-factory.util.dart';
import 'api-client.service.dart';

abstract class CoinListService {
  static Future<PaginationData<CoinEntity>> getCoins({
    int page = 1,
    int limit = 10,
    String search = '',
  }) async {
    final coinJson = await ApiClientService.get(endpoint: [
      'api',
      'coins',
    ], params: {
      'page': '$page',
      'size': '$limit',
      'search': search,
    });

    final List<CoinEntity> coins = fromJsonAsList<CoinEntity>(
      coinJson['coins'],
      CoinEntity.fromJson,
    );

    final int totalAmount = coinJson['totalAmount'];

    return PaginationData(
      config: PaginationConfig(
        page: page,
        totalAmount: totalAmount,
        limit: limit,
      ),
      items: coins,
    );
  }

  static Future<CoinEntity> getCoinById(String id) async {
    final coinJson = await ApiClientService.get(endpoint: [
      'api',
      'coins',
      id,
    ]);

    return CoinEntity.fromJson(coinJson);
  }
}
