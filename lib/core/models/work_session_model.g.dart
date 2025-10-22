// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkSessionModelAdapter extends TypeAdapter<WorkSessionModel> {
  @override
  final int typeId = 2;

  @override
  WorkSessionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkSessionModel(
      id: fields[0] as String,
      taskId: fields[1] as String?,
      startTime: fields[2] as DateTime,
      endTime: fields[3] as DateTime,
      durationInSeconds: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WorkSessionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.taskId)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.endTime)
      ..writeByte(4)
      ..write(obj.durationInSeconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkSessionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
