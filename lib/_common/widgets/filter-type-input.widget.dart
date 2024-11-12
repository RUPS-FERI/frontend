import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../entities/filter.model.dart';
import 'outlined-input-field.widget.dart';

class FilterTypeInput extends StatelessWidget {
  final FilterType type;
  final void Function(Map<String, num>) onFilerParamsChange;

  const FilterTypeInput({
    super.key,
    required this.type,
    required this.onFilerParamsChange,
  });

  @override
  Widget build(BuildContext context) {
    if (type == FilterType.between) {
      final Map<String, num> betweenParams = {};
      return Column(
        children: [
          OutlinedInputFiled(
            label: 'Min',
            inputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChange: (String value) {
              betweenParams['min'] = num.parse(value);
              onFilerParamsChange(betweenParams);
            },
          ),
          const SizedBox(height: 10.0),
          OutlinedInputFiled(
            label: 'Max',
            inputType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChange: (String value) {
              betweenParams['max'] = num.parse(value);
              onFilerParamsChange(betweenParams);
            },
          ),
        ],
      );
    } else if (type == FilterType.greaterThan) {
      return OutlinedInputFiled(
        label: 'Lower Bound',
        inputType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChange: (String value) =>
            onFilerParamsChange({'lowerBound': num.parse(value)}),
      );
    } else if (type == FilterType.lowerThan) {
      return OutlinedInputFiled(
        label: 'Upper Bound',
        inputType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChange: (String value) =>
            onFilerParamsChange({'upperBound': num.parse(value)}),
      );
    }
    return const Text('Unsupported filter type');
  }
}
