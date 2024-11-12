import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/views/coins/widget/table-settings-dialog.widget.dart';

import '../../../_common/utils/color-constants.util.dart';
import 'create-filter-dialog.widget.dart';

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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CoinCreateFilterDialog(),
              );
            },
          ),
        ),
        const Divider(color: ColorConstants.commonGray),
        Expanded(child: Container()),
        const CoinTableSettingsDialog()
      ],
    );
  }
}
