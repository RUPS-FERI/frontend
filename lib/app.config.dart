import 'package:frontend/views/coins/coin-detail.view.dart';
import 'package:frontend/views/coins/coins.view.dart';
import 'package:go_router/go_router.dart';

abstract class AppConfig {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const CoinsView()),
    GoRoute(
      path: '/:id',
      name: 'coinDetail',
      builder: (context, state) => CoinDetailView(
        coinId: state.pathParameters['id']!,
      ),
    ),
  ]);
}
