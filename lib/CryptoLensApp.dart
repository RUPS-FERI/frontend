import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app.config.dart';

class CryptoLensApp extends StatelessWidget {
  const CryptoLensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppConfig.router,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.coinViewTitle,
    );
  }
}