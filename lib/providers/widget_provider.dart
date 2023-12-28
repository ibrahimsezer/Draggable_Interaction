import 'dart:developer';
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

  void movingWidgetsWithCanvas(double horizontalOffPixel, double verticalOffPixel,double horizontalGlobPixel,double veritcalGlobPixel){
    WidgetModel.widgetModelList.map((e) {
      if (horizontalOffPixel> 0) {
        e.posX += horizontalGlobPixel;
      } else {
        e.posX -= horizontalGlobPixel;
      }
      if (verticalOffPixel > 0) {
        e.posY += veritcalGlobPixel;
      } else {
        e.posY -= veritcalGlobPixel;
      }
    });
    notifyListeners();
  }

}
