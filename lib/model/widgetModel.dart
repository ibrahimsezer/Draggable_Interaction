import 'dart:developer';
import 'package:draggable_example/model/example.dart';
import 'package:draggable_example/ui/widgets/stickyNoteWidget.dart';
import 'package:flutter/material.dart';

class WidgetModel {
  int myId;
  Widget widget;
  bool isSelected;

  WidgetModel(
      {required this.myId, required this.widget, required this.isSelected});

  static List<WidgetModel> widgetModelList = [];
  static int idCount = widgetModelList.length;
  static List<int> modelIdList = [];

  void onTap(){
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

  void deleteItem(int myId) {
    WidgetModel.widgetModelList.remove(WidgetModel.widgetModelList[myId]);
    log(WidgetModel.widgetModelList.toString());
    notifyListeners();
  }

  void deleteSelectedWidget() {
    int selectedIndex =
        WidgetModel.widgetModelList.indexWhere((model) => model.isSelected);
    if (selectedIndex != -1) {
      WidgetModel.widgetModelList.removeAt(selectedIndex);
    }
  }
}

// class MyModel {
//   int id;
//   Widget widget;
//
//   MyModel({required this.id, required this.widget});
//
//   // Yeni onTap fonksiyonu
//   void onTap() {
//     // Burada widget'ın id'sini kullanabilirsiniz
//     print("Widget id: $id tıkladı.");
//   }
// }

//MyModel myModel = MyModel(
//   id: 1, // İstediğiniz id değerini burada belirleyin
//   widget: GestureDetector(
//     onTap: () {
//       myModel.onTap(); // Bu tıklanabilir widget'ın id'sini alır
//     },
//     child: YourWidget(), // Tıklanabilir widget'ınız
//   ),
// );
//
// // Şimdi bu myModel nesnesini bir listeye ekleyebilirsiniz.
// List<MyModel> modelList = [myModel];