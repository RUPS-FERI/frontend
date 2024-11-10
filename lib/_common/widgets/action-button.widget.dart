import 'package:flutter/material.dart';

import '../utils/color-constants.util.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final BorderRadius borderRadius;
  final EdgeInsets? padding;
  final bool enabled;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = BorderRadius.zero,
    this.padding,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((state) {
            if (state.contains(WidgetState.disabled)) {
              return ColorConstants.commonGray;
            }
            return ColorConstants.actionBlueColor;
          }),
          foregroundColor:  WidgetStateProperty.resolveWith((state) {
            if (state.contains(WidgetState.disabled)) {
              return ColorConstants.disabledText;
            }
            return Colors.white;
          }),
          padding: WidgetStatePropertyAll(padding),
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: borderRadius)
          )
      ),
      child: Text(text),
    );
  }
}
