import 'dart:developer';
import 'package:flutter/material.dart';

class WidgetModel {
  int myId;
  Widget widget;

  WidgetModel({required this.myId, required this.widget});

  static List<WidgetModel> widgetModelList = [];
  static int idCount = widgetModelList.length;
}

class WidgetFunctions with ChangeNotifier {
  void addItem(WidgetModel model) {
    WidgetModel.widgetModelList.add(model);
    log(WidgetModel.idCount.toString());

    /// id : widget
    int myIdOfFirstItem = WidgetModel.widgetModelList[0].myId;
    Widget widgetOfFirstItem = WidgetModel.widgetModelList[0].widget;
    notifyListeners();
  }

  void deleteItem(int myId) {
    WidgetModel.widgetModelList.remove(WidgetModel.widgetModelList[myId]);
    log(WidgetModel.widgetModelList
        .remove(WidgetModel.widgetModelList[myId])
        .toString());
    notifyListeners();
  }
}
