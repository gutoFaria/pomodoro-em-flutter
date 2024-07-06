import 'package:flutter/material.dart';
import 'package:pomodoro_flutter/timerservice.dart';
import 'package:pomodoro_flutter/utils/utils.dart';
import 'package:pomodoro_flutter/widgets/progresswidget.dart';
import 'package:pomodoro_flutter/widgets/timercard.dart';
import 'package:pomodoro_flutter/widgets/timercontroller.dart';
import 'package:pomodoro_flutter/widgets/timeroptions.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          'POMOTIMER',
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<TimerService>(context, listen: false).reset();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 40,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TimerCard(),
              SizedBox(
                height: 30,
              ),
              Timeroptions(),
              SizedBox(
                height: 30,
              ),
              TimerController(),
              SizedBox(height: 30,),
              Progresswidget()
            ],
          ),
        ),
      ),
    );
  }
}
