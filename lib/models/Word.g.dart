// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordAdapter extends TypeAdapter<Word> {
  @override
  final int typeId = 1;

  @override
  Word read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Word(
      word: fields[1] as String,
      meaning: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Word obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.word)
      ..writeByte(2)
      ..write(obj.meaning);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
