import 'dart:core';
import 'package:fylo_data_storage/interfaces/data.dart';
import 'package:fylo_data_storage/model/layout.dart';

class CalculateUISizePerLayout implements Calculator {
  static Map<String, int> baseValues;
  static Map<String, Data<double>> deviceWidth;

  @override
  double calculate(Map<String, double> uiData) {
    var currentLayout = DecideBetweenTwoLayouts().get();

    if (uiData.containsKey(currentLayout)) {
      return uiData[currentLayout] /
          baseValues[currentLayout] *
          deviceWidth[currentLayout].get();
    }

    return null;
  }
}
