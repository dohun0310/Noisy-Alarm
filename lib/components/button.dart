import 'package:flutter/material.dart';

import 'package:noisyalarm/theme.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.color,
    required this.onTap,
    required this.text,
  });

  final Color? color;
  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          width: 100,
          height: 50,
          child: Text(
            text,
            style: ThemeTexts.title3Regular.copyWith(
              color: Theme.of(context).extension<AppExtension>()?.colors.text,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}