import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class notemodel {
  @HiveField(0)
  String name = '';
  @HiveField(1)
  String description = '';
  @HiveField(2)
  String date = '';

  notemodel(name, description, date) {
    this.name = name;
    this.description = description;
    this.date = date;
  }
}
