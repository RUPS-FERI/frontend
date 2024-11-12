import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/_common/bloc/coin/table_settings/coin-table-settings.bloc.dart';

import '../../../_common/bloc/coin/table_settings/coin-table-settings.state.dart';
import '../../../_common/utils/color-constants.util.dart';
import '../../../_common/widgets/reorderable-tittled-list-view.widget.dart';
import '../../../_common/widgets/titled-listview.widget.dart';

class CoinTableColumnSettings extends StatelessWidget {
  const CoinTableColumnSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final CoinTableSettingsBloc coinTableSettingsBloc =
        context.read<CoinTableSettingsBloc>();
    return BlocBuilder<CoinTableSettingsBloc, CoinTableSettingsState>(
        bloc: coinTableSettingsBloc,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TitledListView(
                    title: 'Invisible Columns',
                    items: state.invisibleColumns,
                    builder: (column) => Card(
                      child: ListTile(
                        title: Text(column),
                        trailing: IconButton(
                          onPressed: () =>
                              coinTableSettingsBloc.makeColumnVisible(column),
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: ColorConstants.actionBlueColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                thickness: 1.5,
                color: ColorConstants.commonGray,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ReorderableTitledListView(
                    title: 'Visible Columns',
                    items: state.visibleColumns,
                    onReorder: coinTableSettingsBloc.moveColumn,
                    builder: (column) => Card(
                      child: ListTile(
                        title: Text(column),
                        leading: IconButton(
                          onPressed: () =>
                              coinTableSettingsBloc.makeColumnInvisible(column),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: ColorConstants.actionRedColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
