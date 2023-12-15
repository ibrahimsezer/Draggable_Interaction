import 'package:draggable_example/model/widget_model.dart';
import 'package:flutter/material.dart';

class WidgetProvider with ChangeNotifier {
  void addWidgetModel(WidgetModel model) {
    WidgetModel.widgetModelList.add(model);
    notifyListeners();
  }

  void allRemoveWidget() {
    WidgetModel.widgetModelList.clear();
    notifyListeners();
  }
}
