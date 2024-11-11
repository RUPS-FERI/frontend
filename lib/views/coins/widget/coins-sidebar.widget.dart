import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/_common/widgets/action-button.widget.dart';

import '../../../_common/utils/color-constants.util.dart';

class CoinsSideBar extends StatefulWidget {
  const CoinsSideBar({super.key});

  @override
  State<CoinsSideBar> createState() => _CoinsSideBarState();
}

final List<String> options =  ['Between', 'Greater than', 'Lower than'];

class _CoinsSideBarState extends State<CoinsSideBar> {
  final List<Map<String, dynamic>> _filters = [];
  final TextEditingController _filterNameController = TextEditingController();
  String currentOption = options[0];

  void _showAddFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            children: [
              TextFormField(
                controller: _filterNameController,
                decoration: InputDecoration(
                  labelText: 'Enter new filter name',
                ),
              ),
              //Row(
              //  children: [
              //    ListTile(
              //      title: const Text('Between'),
              //      leading: Radio(value: options[0], groupValue: currentOption, onChanged: (value) {currentOption = value.toString();}),
              //    ),
              //    ListTile(
              //      title: const Text('Greater than'),
              //      leading: Radio(value: options[1], groupValue: currentOption, onChanged: (value) {currentOption = value.toString();}),
              //    ),
              //    ListTile(
              //      title: const Text('Lower than'),
              //      leading: Radio(value: options[2], groupValue: currentOption, onChanged: (value) {currentOption = value.toString();}),
              //    )
              //  ],
              //)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_filterNameController.text.isNotEmpty) {
                  setState(() {
                    _filters.add({
                      "name": _filterNameController.text,
                      "isApplied": true,
                    });
                  });
                  _filterNameController.clear();
                }
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.filters),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddFilterDialog,
          ),
        ),
        const Divider(color: ColorConstants.commonGray),
        Expanded(
          child: ListView.builder(
            itemCount: _filters.length,
            itemBuilder: (context, index) {
              final filter = _filters[index];
              return ListTile(
                title: Text(filter['name']),
                leading: IconButton(
                  icon: Icon(
                    filter['isApplied'] ? Icons.visibility : Icons.visibility_off,
                    color: filter['isApplied']
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      filter['isApplied'] = !filter['isApplied'];
                    });
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      _filters.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
        ),
        ActionButton(
          padding: const EdgeInsets.symmetric(vertical: 30),
          text: AppLocalizations.of(context)!.settings,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  void dispose() {
    _filterNameController.dispose();
    super.dispose();
  }
}