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
      required this.text,
      required this.widgetName});

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
  String text;
  @HiveField(6)
  Widget widgetName;
}
