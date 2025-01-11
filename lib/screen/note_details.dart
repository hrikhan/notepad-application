import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad_application/controllar/home_controllar.dart';


class NoteDetails extends StatelessWidget {
  NoteDetails({super.key});
HomeControllar homeControllar = Get.put(HomeControllar());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note Details'), actions: [
        IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
             
            }),
             GestureDetector(
              onTap: () {
                
              },
              child: Icon(Icons.copy)),
              
               
      ]),
    );
  }
}
