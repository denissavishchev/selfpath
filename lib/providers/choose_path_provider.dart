import 'package:flutter/material.dart';

class ChoosePathProvider with ChangeNotifier {

  int selectedQuestion = 1;
  int selectedAnswer = -1;
  List<int> answers = [];

  void selectAnswer(int index){
    selectedAnswer = index;
    notifyListeners();
  }

  void toNextQuestion(){
    if(selectedQuestion > 7){
      selectedQuestion = 0;
    }else{
      selectedQuestion++;
    }
    answers.add(selectedAnswer);
    selectedAnswer = -1;
    notifyListeners();
  }

}