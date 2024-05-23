// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientsDBAdapter extends TypeAdapter<IngredientsDB> {
  @override
  final int typeId = 0;

  @override
  IngredientsDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientsDB(
      isSelect: fields[4] as bool?,
      id: fields[0] as int?,
      name: fields[1] as String?,
      count: fields[2] as int?,
      gramm: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IngredientsDB obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.gramm)
      ..writeByte(4)
      ..write(obj.isSelect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientsDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InstructionsDBAdapter extends TypeAdapter<InstructionsDB> {
  @override
  final int typeId = 1;

  @override
  InstructionsDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InstructionsDB(
      id: fields[1] as int,
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InstructionsDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstructionsDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecipesDBAdapter extends TypeAdapter<RecipesDB> {
  @override
  final int typeId = 2;

  @override
  RecipesDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipesDB(
      id: fields[10] as int,
      name: fields[0] as String,
      about: fields[1] as String,
      tags: fields[2] as String,
      mark: fields[3] as int,
      person: fields[5] as int,
      ingredients: (fields[6] as List?)?.cast<IngredientsDB>(),
      note: fields[7] as String,
      category: fields[8] as int,
      instructions: (fields[9] as List?)?.cast<InstructionsDB>(),
      favourites: fields[4] as bool,
      isSelect: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RecipesDB obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.about)
      ..writeByte(2)
      ..write(obj.tags)
      ..writeByte(3)
      ..write(obj.mark)
      ..writeByte(4)
      ..write(obj.favourites)
      ..writeByte(5)
      ..write(obj.person)
      ..writeByte(6)
      ..write(obj.ingredients)
      ..writeByte(7)
      ..write(obj.note)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.instructions)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.isSelect);
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

class DayMenuDBAdapter extends TypeAdapter<DayMenuDB> {
  @override
  final int typeId = 3;

  @override
  DayMenuDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayMenuDB(
      id: fields[0] as int?,
      text: fields[1] as String?,
      date: fields[2] as String?,
      recipes: (fields[3] as List?)?.cast<RecipesDB>(),
    );
  }

  @override
  void write(BinaryWriter writer, DayMenuDB obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.recipes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayMenuDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MenuDBAdapter extends TypeAdapter<MenuDB> {
  @override
  final int typeId = 4;

  @override
  MenuDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuDB(
      days: (fields[0] as List?)?.cast<DayMenuDB>(),
      isWeek: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MenuDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.days)
      ..writeByte(1)
      ..write(obj.isWeek);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PurchasesDBAdapter extends TypeAdapter<PurchasesDB> {
  @override
  final int typeId = 5;

  @override
  PurchasesDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchasesDB(
      isOpen: fields[2] as bool?,
      ingredients: (fields[0] as List?)?.cast<IngredientsDB>(),
      date: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PurchasesDB obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ingredients)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.isOpen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchasesDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
