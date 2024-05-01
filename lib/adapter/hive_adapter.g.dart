// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipesDBAdapter extends TypeAdapter<RecipesDB> {
  @override
  final int typeId = 0;

  @override
  RecipesDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipesDB(
      name: fields[0] as String?,
      about: fields[2] as String?,
      tags: fields[3] as String?,
      note: fields[6] as String?,
      ingredients: (fields[7] as Map?)?.cast<int, dynamic>(),
      category: fields[1] as bool?,
      favourites: fields[5] as bool?,
      marks: fields[4] as int?,
      count: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, RecipesDB obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.about)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.marks)
      ..writeByte(5)
      ..write(obj.favourites)
      ..writeByte(6)
      ..write(obj.note)
      ..writeByte(7)
      ..write(obj.ingredients)
      ..writeByte(8)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipesDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InstructionsAdapter extends TypeAdapter<Instructions> {
  @override
  final int typeId = 1;

  @override
  Instructions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Instructions(
      step: (fields[0] as Map?)?.cast<int, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Instructions obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.step);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstructionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
