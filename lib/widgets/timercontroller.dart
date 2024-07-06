import 'package:flutter/material.dart';
import 'package:pomodoro_flutter/timerservice.dart';
import 'package:provider/provider.dart';

class TimerController extends StatefulWidget {
  const TimerController({super.key});

  @override
  State<TimerController> createState() => _TimerControllerState();
}

class _TimerControllerState extends State<TimerController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Container(
      width: 100,
      height: 100,
      decoration:const  BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.circle
      ),
      child: Center(
        child: IconButton(
          icon: provider.timerPlaing ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
          color: Colors.white,
          iconSize: 55,
          onPressed: () {
            provider.timerPlaing ? Provider.of<TimerService>(context,listen: false).pause() : Provider.of<TimerService>(context,listen: false).start();
          },
        ),
      ),
    );
  }
}