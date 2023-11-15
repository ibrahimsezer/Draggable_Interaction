import 'dart:developer';
import 'package:draggable_example/model/this_model.dart';
import 'package:flutter/material.dart';

class WidgetModel {
  final int myId;
  Widget widget;
  bool isSelected;

  WidgetModel(
      {required this.myId, required this.widget, required this.isSelected});

  static List<WidgetModel> widgetModelList = [];
  static int idCount = widgetModelList.length;
  static List<int> modelIdList = [];
}

class WidgetFunctions with ChangeNotifier {
  void addItem(WidgetModel model) {
    WidgetModel.widgetModelList.add(model);
    log(WidgetModel.idCount.toString());
    notifyListeners();
  }

  void addThisModel(ThisModel model) {
    ThisModel.thisModelList.add(model);
    notifyListeners();
  }
}
