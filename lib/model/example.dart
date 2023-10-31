import 'package:draggable_example/model/widgetModel.dart';
import 'package:draggable_example/ui/widgets/noteWidget.dart';
import 'package:draggable_example/ui/widgets/stickyNoteWidget.dart';
import 'package:flutter/material.dart';

List<Model> widgetList = [];

class Model {
  int id;
  Widget widget;

  Model({required this.id, required this.widget});
}

addList(Model model) {
  widgetList.add(model);
  print(model.id);
}

removeList(int id) {
  widgetList.remove(widgetList[id]);
}

int getCount(){
  int count = 0;
  return count++;
}
get count => getCount();

void main() {
  Model modelwid = Model(
      widget: NoteWidget(
        getText: count,
      ),
      id: widgetList.length);
  addList(modelwid);
  addList(modelwid);
  addList(modelwid);
  addList(modelwid);
  print(widgetList.length);
  Model modelwid2 = Model(
      widget:  NoteWidget(
        getText: count,
      ),
      id: widgetList.length);



  if (modelwid.id == 0) {
    print("modelwid : ${modelwid.widget}");
    removeList(modelwid.id);
    removeList(WidgetModel.widgetModelList.length);
    print("if : removelist ${widgetList.toList()}");
  }
}
