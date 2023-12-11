// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WidgetDataAdapter extends TypeAdapter<WidgetData> {
  @override
  final int typeId = 1;

  @override
  WidgetData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WidgetData(
      id: fields[0] as int,
      posX: fields[1] as double,
      posY: fields[2] as double,
      width: fields[3] as double,
      height: fields[4] as double,
      text: fields[5] as String,
      widgetName: fields[6] as Widget,
    );
  }

  @override
  void write(BinaryWriter writer, WidgetData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.posX)
      ..writeByte(2)
      ..write(obj.posY)
      ..writeByte(3)
      ..write(obj.width)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.text)
      ..writeByte(6)
      ..write(obj.widgetName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WidgetDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
