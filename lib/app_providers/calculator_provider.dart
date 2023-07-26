import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorProvider with ChangeNotifier {
  late  int _firstValue;
  late  int _secondValue;
  late  String _action;

  CalculatorProvider(
      { int? first,  int? second,  String? action})
      : _firstValue = first ?? 0,
        _secondValue = second ?? 0,
        _action = action ?? '';

  String getAction(){
    notifyListeners();
    return _action;

  }


  String getResult(){
    String result = "";
    switch(_action){
      case  "+":
        result = (_firstValue + _secondValue).toString();
        break;
      case "-":
        result = (_firstValue - _secondValue).toString();
        break;
      case "*":
        result = (_firstValue*_secondValue).toString();
        break;
      case "÷":
        if(_secondValue>0){
          result = (_firstValue~/_secondValue).toString();
        }else if(_secondValue==0&&_firstValue==0){
          result = '0';
        }else if(_secondValue<=0){
          result = "Cannot divisible";
        }
        break;

      case "%":
        result = (_firstValue%_secondValue).toString();
        break;
      case "avr":
        result = ((_firstValue+_secondValue)~/2).toString();
        break;
      case "geo":
        result = (sqrt(_firstValue*_secondValue).toInt()).toString();
        break;
    }
    notifyListeners();
    return result;

  }

  void setFirst(int parse) {
    _firstValue=parse;
    // notifyListeners();
  }

  void setSecond(int parse){
    _secondValue=parse;
    // notifyListeners();
  }

  String setAction(String action){
    _action=action;
    return _action;
    // notifyListeners();
  }
}
