
import 'package:get/get.dart';
import 'package:notepad_application/note_model/note_model.dart';

class HomeControllar extends GetxController {
  List<notemodel> note = [];
  void addnote(notemodel note) {
    this.note.add(note);
    update();
  }
  void deletenote(int index) {
    this.note.removeAt(index);
    update();
  }
}
