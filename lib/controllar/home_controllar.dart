import 'package:get/get.dart';
import 'package:notepad_application/note_model/note_model.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeControllar extends GetxController {
  final Box box = Hive.box('notes');


  void addnote(notemodel note) {
    box.add(note);
    update();
  }

  void deletenote(int index) {
    box.deleteAt(index);
    update();
  }

  void editnote(notemodel note, int index) {
    box.putAt(index, note);
    update();
  }
}
