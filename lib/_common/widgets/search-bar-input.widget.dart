import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/_common/bloc/coin/list/coin-list.bloc.dart';
import 'package:frontend/_common/bloc/coin/list/coin-list.event.dart';

class SearchBarInput extends StatelessWidget {
  const SearchBarInput({super.key});

  @override
  Widget build(BuildContext context) {
    final CoinListBloc coinListBloc = context.read<CoinListBloc>();
    coinListBloc.add(const LoadCoinsEvent(page: 1));

    return SearchBar(
      overlayColor: const WidgetStatePropertyAll(Colors.white),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      hintText: AppLocalizations.of(context)!.searchBarHint,
      leading: const Icon(Icons.search),
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
      onChanged: (search) => coinListBloc.add(SearchCoinEvent(search: search)),
    );
  }
}
