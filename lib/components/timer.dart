import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimerUI extends StatelessWidget {
  const TimerUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 30,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "00",
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ValueInputFormatter(minVal: 0, maxVal: 99)
                    ],
                    style: const TextStyle(fontSize: 48),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(":", style: TextStyle(fontSize: 48)),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "00",
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ValueInputFormatter(minVal: 0, maxVal: 59)
                    ],
                    style: const TextStyle(fontSize: 48),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(":", style: TextStyle(fontSize: 48)),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "00",
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ValueInputFormatter(minVal: 0, maxVal: 59)
                    ],
                    style: const TextStyle(fontSize: 48),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
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