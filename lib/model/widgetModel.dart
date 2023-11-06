import 'dart:developer';
import 'package:draggable_example/exmp/thisModel.dart';
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

  void onTap() {
    int onTapId = myId;
    print("OnTapId : $onTapId");
  }
}

class WidgetFunctions with ChangeNotifier {
  void addItem(WidgetModel model) {
    WidgetModel.widgetModelList.add(model);
    log(WidgetModel.idCount.toString());
    notifyListeners();
  }

  void deleteWidget(WidgetModel widgetModel) {
    WidgetModel.widgetModelList.remove(widgetModel);
  }

  void deleteItem(int id) {
    WidgetModel.widgetModelList.removeWhere((model) => model.myId == id);
    notifyListeners();
  }

  void addThisModel(ThisModel model) {
    ThisModel.thisModelList.add(model);
    notifyListeners();
  }

  void addThisModelActive(bool active) {
    ThisModel.thisModelActiveList.add(active);
    notifyListeners();
  }

  void deleteThisModel(ThisModel model) {
    model.isActive = true;
    if (model.isActive == true && ThisModel.thisModelActiveList != null) {
      ThisModel.thisModelList.removeAt(model.id);
    }
    notifyListeners();
  }

  void deleteThisModelActive(ThisModel model) {
    model.isActive = true;
    log("first : ${ThisModel.thisModelActiveList}");
    if (model.isActive == true && ThisModel.thisModelActiveList != null) {
      ThisModel.thisModelActiveList.removeLast();
      log("last : ${ThisModel.thisModelActiveList}");
    }
  }
}
