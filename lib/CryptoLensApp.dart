import 'package:flutter/material.dart';

import 'app.config.dart';

class CryptoLensApp extends StatelessWidget {
  const CryptoLensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppConfig.router,
      title: 'CryptoLens',
    );
  }
}