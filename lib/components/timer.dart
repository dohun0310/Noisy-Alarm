import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimerUI extends StatelessWidget {
  const TimerUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.grey,
            width: 30,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(200)
          ),
        ),
        child:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TimerTextFormField(hint: '00', maxVal: 99),
            TimerColon(),
            TimerTextFormField(hint: '00', maxVal: 59),
            TimerColon(),
            TimerTextFormField(hint: '00', maxVal: 59),
          ],
        ),
      ),
    );
  }
}

class TimerColon extends StatelessWidget {
  const TimerColon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(":", style: TextStyle(fontSize: 48));
  }
}

class TimerTextFormField extends StatelessWidget {
  final String hint;
  final int maxVal;

  const TimerTextFormField({super.key, required this.hint, required this.maxVal,});

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