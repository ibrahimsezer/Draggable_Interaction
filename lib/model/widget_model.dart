import 'package:flutter/material.dart';

class WidgetModel {
  final int id;
  final Widget widget;
  final double posX;
  final double posY;
  final double width;
  final double height;

  WidgetModel({
    required this.posX,
    required this.posY,
    required this.width,
    required this.height,
    required this.id,
    required this.widget,
  });

  static List<WidgetModel> widgetModelList = [];

  @override
  String toString() {
    return 'WidgetModel{id : $id, Widget : $widget}';
  }
}
