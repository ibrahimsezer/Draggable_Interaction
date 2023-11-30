import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'widget_data.g.dart';

@HiveType(typeId: 1)
class WidgetData {
  WidgetData(
      {required this.id,
      required this.posX,
      required this.posY,
      required this.width,
      required this.height,
      required this.widgetName,
      required this.text});

  @HiveField(0)
  int id;
  @HiveField(1)
  double posX;
  @HiveField(2)
  double posY;
  @HiveField(3)
  double width;
  @HiveField(4)
  double height;
  @HiveField(5)
  Widget widgetName;
  @HiveField(6)
  String text;
}
