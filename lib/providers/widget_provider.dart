import 'dart:math';
import 'package:draggable_example/model/widget_model.dart';
import 'package:flutter/material.dart';

class WidgetProvider with ChangeNotifier {
  double _posOffsetX = 0;
  double _posOffsetY = 0;

  double get posOffsetX => _posOffsetX;

  double get posOffsetY => _posOffsetY;

  double _activityBarPosY = 0;
  double _activityBarPosX = 0;

  double get activityBarPosX => _activityBarPosX;

  double get activityBarPosY => _activityBarPosY;

  // List<double> getWidgetSizeFromModel(width, height) {
  //   notifyListeners();
  //   return [width, height];
  // }

  double _getWidgetWidth = 0;
  double _getWidgetHeight = 0;

  double get getWidgetWidth => _getWidgetWidth;

  double get getWidgetHeight => _getWidgetHeight;

  set getWidgetWidth(double width) {
    _getWidgetWidth = width;
    notifyListeners();
  }

  set getWidgetHeight(double height) {
    _getWidgetHeight = height;
    notifyListeners();
  }

  set activityBarPosX(double newPos) {
    _activityBarPosX = newPos;
    notifyListeners();
  }

  set activityBarPosY(double newPos) {
    _activityBarPosY = newPos;
    notifyListeners();
  }

  set posOffsetX(double newOffset) {
    _posOffsetX = newOffset;
    notifyListeners();
  }

  set posOffsetY(double newOffset) {
    _posOffsetY = newOffset;
    notifyListeners();
  }

  void addWidgetModel(WidgetModel model) {
    WidgetModel.widgetModelList.add(model);
    notifyListeners();
  }

  void allRemoveWidget() {
    WidgetModel.widgetModelList.clear();
    notifyListeners();
  }
}
