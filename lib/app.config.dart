import 'package:frontend/views/coins/coins.view.dart';
import 'package:go_router/go_router.dart';

abstract class AppConfig {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const CoinsView(),
        routes: const []
    )
  ]);
}