import 'package:draggable_example/ui/widgets/shape.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

List<Map> collectionList = [];
List<Widget> collectionWidget = [
  const TriangleShapeWidget(),
  const EllipseShapeWidget(),
  const RoundedRectangleShapeWidget(),
  const RectangleShapeWidget()
];

class HiveData {
  bool isActive = true;
  Widget? widgetName;
  late List<Map<dynamic, dynamic>?> widgets;

  Future<void> getCollection() async {
    for (int i = 0; i < collectionWidget.length; i++) {
      widgetName = collectionWidget[i];
      final widgetMap = {
        "widgetName": widgetName,
      };
      collectionList.add({
        "Widget $i": {
          "name": widgetName,
        }
      });
      final collection = await BoxCollection.open(
        path: "/data/data/com.example.draggable_example/app_flutter",
        "WidgetDb",
        {"Widget"},
      );
      final widgetBox = collection.openBox<Map>('Widget');
      await widgetBox.then((box) => box.put("Widget $i", widgetMap));
      widgets = await widgetBox.then((box) => box.getAll(["Widget $i"]));
      print(widgets);
    }
  }
}

@HiveType(typeId: 0)
class DataModel {
  @HiveField(0)
  final int dataId;
  @HiveField(1)
  final double dataPosX;
  @HiveField(2)
  final double dataPosY;
  @HiveField(3)
  final double dataWidth;
  @HiveField(4)
  final double dataHeight;

  DataModel(this.dataPosX, this.dataPosY, this.dataWidth, this.dataHeight,
      this.dataId,
      {required});
}
