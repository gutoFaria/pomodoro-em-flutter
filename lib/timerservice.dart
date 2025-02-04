import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaing = false;
  int rounds = 0;
  int goal = 0;
  String currentState = 'FOCUS';

  void start() {
    timerPlaing = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timer.cancel();
    timerPlaing = false;
    notifyListeners();
  }

  void reset(){
    timer.cancel();
    currentState = 'FOCUS';
    currentDuration = selectedTime = 1500;
    rounds = goal = 0;
    timerPlaing = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void handleNextRound(){
    if(currentState == 'FOCUS' && rounds != 3){
      currentState = 'BREAK';
      currentDuration = 300;
      selectedTime = 300;
      rounds++;
      goal++;
    }else if(currentState == 'BREAK'){
      currentState = 'FOCUS';
      currentDuration = 1500;
      selectedTime = 1500;
    }else if(currentState == 'FOCUS' && rounds == 3){
      currentState = 'LONGBREAK';
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goal++;
    }else if(currentState == 'LONGBRAK'){
      currentState = 'FOCUS';
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;

    }
    notifyListeners();
  }
}
