import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NumberField extends StatelessWidget {
  final String hint;
  final int maxVal;

  const NumberField({super.key, required this.hint, required this.maxVal,});

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
        style: const TextStyle(fontSize: 48),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ValueInputFormatter extends TextInputFormatter {
  final int maxVal;
  final int minVal;
  ValueInputFormatter({required this.maxVal, required this.minVal});

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