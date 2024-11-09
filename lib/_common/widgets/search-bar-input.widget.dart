import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchBarInput extends StatelessWidget {
  const SearchBarInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      overlayColor: const WidgetStatePropertyAll(Colors.white),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      hintText: AppLocalizations.of(context)!.searchBarHint,
      leading: const Icon(Icons.search),
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          )
      ),
    );
  }
}
