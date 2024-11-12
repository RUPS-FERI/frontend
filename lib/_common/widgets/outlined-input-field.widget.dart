import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color-constants.util.dart';

class OutlinedInputFiled extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextInputType? inputType;
  final List<TextInputFormatter> inputFormatters;
  final void Function(String)? onChange;

  const OutlinedInputFiled(
      {super.key,
      this.label,
      this.hint,
      this.textAlign,
      this.textStyle,
      this.onChange,
      this.inputType,
      this.inputFormatters = const []});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      style: textStyle,
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.actionBlueColor,
            width: 2.0,
          ),
        ),
        hintText: hint,
        labelText: label,
        floatingLabelStyle: const TextStyle(
          color: ColorConstants.actionBlueColor,
        ),
      ),
    );
  }
}
