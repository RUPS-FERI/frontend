import 'package:flutter/material.dart';

import '../utils/color-constants.util.dart';

class PropertiesList extends StatelessWidget {
  final int selectedIndex;
  final Function(String) onPropertySelected;
  final List<String> properties;

  const PropertiesList(
      {super.key,
      required this.properties,
      required this.selectedIndex,
      required this.onPropertySelected});

  WidgetStateProperty<Color> _getSelectablePropertyForeground(String property) {
    return WidgetStateProperty.resolveWith((state) {
      if (_propertyIsSelected(property)) {
        return Colors.white;
      }
      return Colors.black;
    });
  }

  WidgetStateProperty<Color?> _getSelectablePropertyColor(String property) {
    return WidgetStateProperty.resolveWith((state) {
      if (_propertyIsSelected(property)) {
        return ColorConstants.actionBlueColor;
      }
      return null;
    });
  }

  bool _propertyIsSelected(String property) =>
      properties.indexOf(property) == selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: properties
          .map(
            (property) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: _getSelectablePropertyForeground(property),
                  backgroundColor: _getSelectablePropertyColor(property),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                child: Text(property),
                onPressed: () => onPropertySelected(property),
              ),
            ),
          )
          .toList(),
    );
  }
}
