import 'package:draggable_example/Data/boxes.dart';
import 'package:draggable_example/Data/widget_data.dart';
import 'package:draggable_example/model/this_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WidgetProvider with ChangeNotifier {
  final String _boxName = "widgetDataBox";
  static List<ThisModel> widgets = [];
  static List<Widget> activeWidgetList = [];
  static List<WidgetData> widgetDataList = [];

  Future<void> addHiveData(WidgetData model) async {
    box = await Hive.openBox(_boxName);
    box.put("key_${model.id}_${model.text}", model);
    var values = box.values.toList();
    for (int i = 0; i < box.values.length; i++) {
      widgetDataList.add(values[i]);
    }
  }

  void addWidget(ThisModel model) {
    widgets.add(model);
    notifyListeners();
  }

  void removeWidget(ThisModel model) {
    widgets.remove(model);
    notifyListeners();
  }

  void allRemoveWidget() {
    ThisModel.thisModelList.clear();
    ThisModel.thisModelActiveList.clear();
    widgets.clear();
    notifyListeners();
  }

  void activeWidgetListAdd() {
    for (int i = 0; i < ThisModel.thisModelList.length; i++) {
      if (ThisModel.thisModelList[i].isActive == true) {
        activeWidgetList.add(ThisModel.thisModelList[i].widget);
      }
    }
  }

  void activePosition() {
    for (int i = 0; i < activeWidgetList.length; i++) {
      activeWidgetList[i];
    }
  }
}
