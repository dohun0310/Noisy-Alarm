import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:noisyalarm/theme.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    super.key,
    required this.hint,
    required this.maxVal
  });

  final String hint;
  final int maxVal;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          ValueInputFormatter(minVal: 0, maxVal: maxVal)
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
    required this.maxVal,
    required this.minVal
  });
  
  final int maxVal;
  final int minVal;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      final int value = int.parse(newValue.text);
      if (value > maxVal || value < minVal) {
        return oldValue;
      }
    }
    return newValue;
  }
}