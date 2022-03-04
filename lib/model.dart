import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier{
  var controller1 = TextEditingController();
  int stepCount = 3;
  void changeText(String text) {
    controller1.text = text;
    notifyListeners();
  }
  void addStep(){
    stepCount=stepCount+1;
    notifyListeners();
  }


}