import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/_common/widgets/action-button.widget.dart';

import '../../../_common/utils/color-constants.util.dart';

class CoinsSideBar extends StatelessWidget {
  const CoinsSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.filters),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
        const Divider(color: ColorConstants.commonGray),
        Expanded(child: Container()),
        ActionButton(
          padding: const EdgeInsets.symmetric(vertical: 30),
          text: AppLocalizations.of(context)!.settings,
          onPressed: () {}
        )
      ],
    );
  }
}
