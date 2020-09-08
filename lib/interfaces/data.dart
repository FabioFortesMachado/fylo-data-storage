import 'dart:core';

abstract class Data<T> {
  T get();
}

abstract class Calculator {
  double calculate(Map<String, double> uiData);
}
