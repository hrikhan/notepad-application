import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad_application/note_model/note_model.dart';
import 'package:notepad_application/screen/homescreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(notemodelAdapter());
  await Hive.openBox('notes');
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
