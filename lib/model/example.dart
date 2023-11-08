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

int getCount() {
  int count = 0;
  return count++;
}

get count => getCount();

void main() {}
