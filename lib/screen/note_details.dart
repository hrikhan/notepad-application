import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:notepad_application/utils/all_style.dart';
import 'package:share_plus/share_plus.dart';

class NoteDetails extends StatelessWidget {
  NoteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final note = Get.arguments;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Note Details',
            style: AllStyle.heading.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(icon: Icon(Icons.edit), onPressed: () {}),
            GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Clipboard.setData(ClipboardData(text: note["description"]));

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.blue,
                      duration: Duration(seconds: 1),
                      content: Text(
                        "description Copied",
                        style: TextStyle(fontSize: 20),
                      )));
                },
                child: Icon(
                  Icons.copy,
                  color: Colors.white,
                )),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () async {
                  await Share.share(
                    'description',
                  );
                },
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                )),
            SizedBox(
              width: 5,
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note["name"],
                style: AllStyle.heading.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                note["date"],
                style: TextStyle(color: Colors.indigo, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  child: Text(note["description"])),
            ],
          ),
        ),
      ),
    );
  }

  //update the
}
