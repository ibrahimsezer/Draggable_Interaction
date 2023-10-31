import 'package:draggable_example/ui/pageDraggable.dart';
import 'package:draggable_example/ui/widgets/noteWidget.dart';
import 'package:flutter/material.dart';

class WidgetModel {
  int myId;
  Widget widget;

  WidgetModel({required this.myId, required this.widget});

  static List<WidgetModel> widgetModelList = [];
  static int idCount = 0;
  WidgetModel newItem = WidgetModel(
      myId: widgetModelList.length,
      widget: NoteWidget(
        getText: tempText,
      ));
}

class WidgetFunctions with ChangeNotifier{
  void addItem(WidgetModel model) {
    WidgetModel.widgetModelList.add(model); /// id : widget
    int myIdOfFirstItem = WidgetModel.widgetModelList[0].myId;
    Widget widgetOfFirstItem = WidgetModel.widgetModelList[0].widget;
    notifyListeners();
  }

  void deleteItem(int myId) {
      WidgetModel.widgetModelList.remove(myId);
      notifyListeners();
    }

}
