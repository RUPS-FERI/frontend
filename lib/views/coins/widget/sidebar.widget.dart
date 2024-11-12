import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/views/coins/widget/table-settings-dialog.widget.dart';

import '../../../_common/bloc/coin/filters/coin-filters.bloc.dart';
import '../../../_common/bloc/coin/filters/coin-filters.state.dart';
import '../../../_common/entities/filter.model.dart';
import '../../../_common/utils/color-constants.util.dart';
import 'create-filter-dialog.widget.dart';

class CoinsSideBar extends StatelessWidget {
  const CoinsSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final CoinFiltersBloc filtersBloc = context.read<CoinFiltersBloc>();

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
        Expanded(
          child: BlocBuilder<CoinFiltersBloc, CoinFiltersSate>(
            bloc: filtersBloc,
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.filters.length,
                itemBuilder: (context, index) {
                  final Filter filter = state.filters[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white,
                    child: ListTile(
                      title: Text(filter.name),
                      leading: IconButton(
                        icon: Icon(
                          filter.enabled
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () => filtersBloc.toggleFilter(
                          filter.name,
                          !filter.enabled,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => filtersBloc.removeFilter(
                          filter.name,
                        ),
                        icon: const Icon(
                          Icons.delete,
                          color: ColorConstants.actionRedColor,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const CoinTableSettingsDialog()
      ],
    );
  }
}
