import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThisModel extends ChangeNotifier {
  final int id;
  final Widget widget;
  bool isActive;

  ThisModel({required this.id, required this.widget, required this.isActive});

  static List<ThisModel> thisModelList = [];
  static List<bool> thisModelActiveList = [];

  @override
  String toString() {
    return 'ThisModel{id : $id, Widget : $widget}';
  }
}
