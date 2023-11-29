import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


//todo RangeError: Not enough bytes available.
@HiveType(typeId: 1)
class ThisModel extends ChangeNotifier {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final Widget widget;
  @HiveField(2)
  bool isActive;

  ThisModel({required this.id, required this.widget, required this.isActive});

  static List<ThisModel> thisModelList = [];
  static List<bool> thisModelActiveList = [];

  @override
  String toString() {
    return 'ThisModel{id : $id, Widget : $widget}';
  }
}

class ThisModelAdapter extends TypeAdapter<ThisModel> {
  @override
  ThisModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThisModel(
        id: fields[0] as int,
        widget: fields[1] as Widget,
        isActive: fields[2] as bool);
  }

  @override
  int get hashCode => typeId.hashCode;
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.widget)
      ..writeByte(1)
      ..write(obj.isActive)
      ..writeByte(2);
  }
}
