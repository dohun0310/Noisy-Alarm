import 'package:flutter/material.dart';

import 'package:noisyalarm/theme.dart';

import 'package:noisyalarm/components/button.dart';
import 'package:noisyalarm/components/numberfield.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  TimerPageState createState() => TimerPageState();
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.timer,
    required this.button,
    this.isTabletOrLandscape = false,
  });

  final Widget timer;
  final Widget button;
  final bool isTabletOrLandscape;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: isTabletOrLandscape
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [timer, const SizedBox(width: 16), button],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [timer, const SizedBox(height: 16), button],
            ),
    );
  }
}

class TimerPageState extends State<TimerPage> {
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController secondsController = TextEditingController();

  bool isStart = false;
  bool isDone = false;
  bool isPaused = false;

  Widget buildScreen() {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    return ResponsiveLayout(
      timer: buildTimer(),
      button: buildButton(),
      isTabletOrLandscape: isTablet || isLandscape,
    );
  }
  
  Widget buildTimer() {
    if (!isStart || isPaused) {
      return Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Theme.of(context).extension<AppExtension>()!.colors.purple,
            width: 12,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(150),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            NumberField(
              controller: hoursController,
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
            NumberField(
              controller: minutesController,
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
            NumberField(
              controller: secondsController,
              hint: '00',
              maxVal: 59,
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: 300,
        height: 300,
        child: CircularProgressIndicator(
          color: Theme.of(context).extension<AppExtension>()?.colors.purple,
          value: 1.0,
          strokeWidth: 12,
        ),
      );
    }
  }

  Widget buildButton() {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    Widget startButton = Button(
      color: Theme.of(context).extension<AppExtension>()?.colors.purple,
      onTap: () {},
      text: '시작',
    );

    Widget resumeButton = Button(
      color: Theme.of(context).extension<AppExtension>()?.colors.purple,
      onTap: () {},
      text: '재개',
    );

    Widget pauseButton = Button(
      color: Theme.of(context).extension<AppExtension>()?.colors.outline,
      onTap: () {},
      text: '일시 정지',
    );

    Widget cancelButton = Button(
      color: Theme.of(context).extension<AppExtension>()?.colors.red,
      onTap: () {},
      text: '취소',
    );
    
    return isStart
        ? (isTablet || isLandscape
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isPaused)
                    resumeButton,
                  if (!isPaused)
                    pauseButton,
                  const SizedBox(height: 16),
                  cancelButton,
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isPaused)
                    resumeButton,
                  if (!isPaused)
                    pauseButton,
                  const SizedBox(width: 16),
                  cancelButton,
                ],
              ))
        : startButton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScreen(),
    );
  } 
}