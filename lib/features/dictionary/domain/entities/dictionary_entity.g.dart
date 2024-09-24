// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DictionaryEntityAdapter extends TypeAdapter<DictionaryEntity> {
  @override
  final int typeId = 0;

  @override
  DictionaryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DictionaryEntity(
      Link: fields[0] as String,
      mainTitle: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DictionaryEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.Link)
      ..writeByte(1)
      ..write(obj.mainTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DictionaryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
