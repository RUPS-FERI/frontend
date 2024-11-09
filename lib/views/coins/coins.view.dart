import 'package:flutter/material.dart';
import 'package:frontend/app.config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CoinsView extends StatelessWidget {
  const CoinsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.coinViewTitle),
      ),
    );
  }
}
