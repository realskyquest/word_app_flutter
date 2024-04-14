import 'package:hive/hive.dart';

part 'saves.g.dart';

@HiveType(typeId: 1)
class SavesModel {
  SavesModel({required this.id, required this.word});

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String word;
}

