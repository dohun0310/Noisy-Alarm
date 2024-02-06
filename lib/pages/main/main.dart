import 'package:flutter/material.dart';

import 'package:noisyalarm/theme.dart';

import 'package:noisyalarm/components/button.dart';
import 'package:noisyalarm/components/numberfield.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  TimerPageState createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  bool isStart = false;
  bool isDone = false;
  bool isPaused = false;

  Widget buildTimer() {
    if (!isStart) {
      return Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Theme.of(context).extension<AppExtension>()!.colors.purple,
            width: 12,
          ),
          borderRadius: BorderRadius.circular(150),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const NumberField(
              hint: '00',
              maxVal: 23,
            ),
            Text(
              ":",
              style: ThemeTexts.bodyEmphasized.copyWith(
                fontSize: 56,
                color: Theme.of(context).extension<AppExtension>()?.colors.text,
              ),
            ),
            const NumberField(
              hint: '00',
              maxVal: 59,
            ),
            Text(
              ":",
              style: ThemeTexts.bodyEmphasized.copyWith(
                fontSize: 56,
                color: Theme.of(context).extension<AppExtension>()?.colors.text,
              ),
            ),
            const NumberField(
              hint: '00',
              maxVal: 59,
            ),
          ],
        ),
      );
    } else {
      return CircularProgressIndicator(
        value: 1.0,
        strokeWidth: 12,
      );
    }

  }

  Widget buildButton() {
    if (!isStart) {
      return Button(
        color: Theme.of(context).extension<AppExtension>()?.colors.purple,
        onTap: () {
          setState(() {
            isStart = true;
            isPaused = false;
            isDone = false;
          });
        },
        text: '시작',
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Button(
            color: Theme.of(context).extension<AppExtension>()?.colors.red,
            onTap: () {
              setState(() {
                isStart = false;
                isPaused = false;
                isDone = true;
              });
            },
            text: '취소',
          ),
          const SizedBox(height: 16),
          Button(
            color: Theme.of(context).extension<AppExtension>()?.colors.outline,
            onTap: () {
              setState(() {
                isPaused = true;
                isDone = false;
              });
            },
            text: '일시 정지',
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTimer(),
            const SizedBox(height: 16),
            buildButton(),
          ],
        )
      ),
    );
  } 
}