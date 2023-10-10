import 'package:flutter/material.dart';

class DraggableItem{
  final GlobalKey key;
  bool shouldRemove;

  DraggableItem(this.key,this.shouldRemove);
}