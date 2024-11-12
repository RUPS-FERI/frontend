import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../_common/widgets/action-button.widget.dart';
import 'column-settings.widget.dart';

class CoinTableSettingsDialog extends StatelessWidget {
  const CoinTableSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ActionButton(
        text: AppLocalizations.of(context)!.settings,
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        onPressed: () => showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.5,
                      child: const CoinTableColumnSettings(),
                    ),
                  ],
                ),
              ),
            ));
  }
}
