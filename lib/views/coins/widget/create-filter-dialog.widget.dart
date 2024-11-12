import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../_common/bloc/coin/filters/coin-filters.bloc.dart';
import '../../../_common/entities/filter.model.dart';
import '../../../_common/widgets/action-button.widget.dart';
import '../../../_common/widgets/filter-type-input.widget.dart';
import '../../../_common/widgets/outlined-input-field.widget.dart';
import '../../../_common/widgets/property-list.widget.dart';

class CoinCreateFilterDialog extends StatefulWidget {
  const CoinCreateFilterDialog({super.key});

  @override
  State<CoinCreateFilterDialog> createState() => _CoinCreateFilterDialogState();
}

class _CoinCreateFilterDialogState extends State<CoinCreateFilterDialog> {
  static List<String> get _selectableProperties =>
      CoinFiltersBloc.availableFilterProperties.keys.toList();

  static List<String> get _filterMethods =>
      FilterType.values.map((type) => type.name).toList();
  final Map<String, num> filterParams = {};

  int _selectedPropertyIndex = -1;
  int _selectedFilterIndex = -1;
  String _filterName = '';

  void _selectProperty(String property) {
    setState(() {
      _selectedPropertyIndex = _selectableProperties.indexOf(property);
    });
  }

  void _selectFilterMethod(String property) {
    setState(() {
      _selectedFilterIndex = _filterMethods.indexOf(property);
      filterParams.clear();
    });
  }

  bool get _canCreateFilter {
    if (_selectedFilterIndex == -1 || _selectedPropertyIndex == -1) {
      return false;
    }
    FilterType type = FilterType.values[_selectedFilterIndex];
    if ((type == FilterType.between && filterParams.length < 2) ||
        filterParams.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final CoinFiltersBloc filtersBloc = context.read<CoinFiltersBloc>();
    final Size size = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(40.0),
        width: size.width * 0.5,
        height: size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OutlinedInputFiled(
              hint: 'Filter name',
              textAlign: TextAlign.center,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              onChange: (value) => setState(() {
                _filterName = value.trim();
              }),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    'Create filter for',
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(1.2),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    child: PropertiesList(
                        properties: _selectableProperties,
                        selectedIndex: _selectedPropertyIndex,
                        onPropertySelected: _selectProperty),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Select filter method',
                        textScaler: TextScaler.linear(1.2),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15.0, bottom: 25.0),
                        child: PropertiesList(
                            properties: _filterMethods,
                            selectedIndex: _selectedFilterIndex,
                            onPropertySelected: _selectFilterMethod),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Builder(
                          builder: (context) {
                            if (_selectedFilterIndex != -1) {
                              return FilterTypeInput(
                                type: FilterType.values[_selectedFilterIndex],
                                onFilerParamsChange: (params) {
                                  setState(() {
                                    filterParams.addAll(params);
                                  });
                                },
                              );
                            }
                            return Container();
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            ActionButton(
              text: 'Create Filter',
              enabled: _canCreateFilter,
              padding: const EdgeInsets.all(20.0),
              borderRadius: BorderRadius.circular(10.0),
              onPressed: () {
                filtersBloc.createFilter(
                  _filterName,
                  _selectableProperties[_selectedPropertyIndex],
                  FilterType.values[_selectedFilterIndex],
                  filterParams,
                );
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
