import 'dart:math';
import 'package:draggable_example/ui/widgets/moduler_widget.dart';
import 'package:flutter/material.dart';

class WidgetProvider with ChangeNotifier {
  List<ModularWidget> _modularModelList = [];

  List<ModularWidget> get widgetModelList => _modularModelList;

  void addWidgetModel(ModularWidget model) {
    _modularModelList.add(model);
    notifyListeners();
  }

  void allRemoveWidget() {
    _modularModelList.clear();
    notifyListeners();
  }

  double _posOffsetX = 0;
  double _posOffsetY = 0;

  double get posOffsetX => _posOffsetX;

  double get posOffsetY => _posOffsetY;

  set posOffsetX(double newOffset) {
    _posOffsetX = newOffset;
    notifyListeners();
  }

  set posOffsetY(double newOffset) {
    _posOffsetY = newOffset;
    notifyListeners();
  }

  double _activityBarPosY = 0;
  double _activityBarPosX = 0;

  double get activityBarPosX => _activityBarPosX;

  double get activityBarPosY => _activityBarPosY;

  set activityBarPosX(double newPos) {
    _activityBarPosX = newPos;
    notifyListeners();
  }

  set activityBarPosY(double newPos) {
    _activityBarPosY = newPos;
    notifyListeners();
  }

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
}
