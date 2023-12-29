import 'package:draggable_example/model/widget_model.dart';
import 'package:flutter/material.dart';

class WidgetProvider with ChangeNotifier {
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

  void addWidgetModel(WidgetModel model) {
    WidgetModel.widgetModelList.add(model);
    notifyListeners();
  }

  void allRemoveWidget() {
    WidgetModel.widgetModelList.clear();
    notifyListeners();
  }
}
