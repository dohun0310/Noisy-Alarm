import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:noisyalarm/theme.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    super.key,
    required this.hint,
    required this.maxVal,
    required this.controller,
  });

  final String hint;
  final int maxVal;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          ValueInputFormatter(minVal: 0, maxVal: maxVal),
        ],
        style: ThemeTexts.largeTitleEmphasized.copyWith(
          fontSize: 56,
          color: Theme.of(context).extension<AppExtension>()?.colors.text,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ValueInputFormatter extends TextInputFormatter {
  ValueInputFormatter({
    required this.minVal,
    required this.maxVal,
  });

  final int minVal;
  final int maxVal;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      final int value = int.tryParse(newValue.text) ?? minVal;
      if (value > maxVal) {
        return TextEditingValue(text: maxVal.toString());
      } else if (value < minVal) {
        return TextEditingValue(text: minVal.toString());
      }
    }
    return newValue;
  }
}
