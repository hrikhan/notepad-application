import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notepad_application/controllar/home_controllar.dart';
import 'package:notepad_application/note_model/note_model.dart';
import 'package:notepad_application/utils/all_colors.dart';
import 'package:notepad_application/utils/all_style.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key, });
  
  HomeControllar homeControllar = Get.put(HomeControllar());
  TextEditingController titlecontrollar = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.bluecolor,
        title: Text(
          'NoteCraft',
          style: AllStyle.heading,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          IconButton(icon: Icon(Icons.add), onPressed: () {})
        ],
      ),
      body: GetBuilder<HomeControllar>(builder: (_) {
        return homeControllar.note.isEmpty
            ? Center(child: Text("No Added note"))
            : Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                    itemCount: homeControllar.note.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          homeControllar.note[index].name,
                          style: AllStyle.subHeading,
                        ),
                        subtitle: Text(homeControllar.note[index].description),
                        trailing: SizedBox(
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  homeControllar.deletenote(index);
                                },
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  showalertdialog_update(context, index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showalertdialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: AllColors.bluecolor,
        foregroundColor: AllColors.whitecolor,
      ),
    );
  }

//adding
  _showalertdialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Text("Add note"),
                content: Column(
                  children: [
                    TextField(
                      controller: titlecontrollar,
                      decoration: InputDecoration(
                        hintText: 'Title',
                      ),
                      onChanged: (value) {
                        // Update the note content here
                      },
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Add description',
                      ),
                      onChanged: (value) {
                        // Update the note title here
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Close',
                        style: AllStyle.subHeading,
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AllColors.bluecolor,
                      ),
                      onPressed: () {
                        if (titlecontrollar.text.isEmpty &&
                            descriptionController.text.isEmpty) {
                          print("is empty.fist fill up.fist");
                        } else {
                          DateTime now = DateTime.now();
                          String readableDate =
                              DateFormat('EEEE, MMM d, yyyy').format(now);
                          homeControllar.addnote(notemodel(
                              titlecontrollar.text,
                              descriptionController.text,
                              readableDate.toString()));
                        }
                        titlecontrollar.clear();
                        descriptionController.clear();
                        Navigator.pop(context);
                      },
                      child: Text('Save', style: AllStyle.subHeading))
                ],
              ),
            ),
          );
        });
  }

  //update the
  showalertdialog_update(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                title: Text("Add note"),
                content: Column(
                  children: [
                    TextField(
                      controller: titlecontrollar,
                      decoration: InputDecoration(
                        hintText: 'Title',
                      ),
                      onChanged: (value) {
                        // Update the note content here
                      },
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Add description',
                      ),
                      onChanged: (value) {
                        // Update the note title here
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Close',
                        style: AllStyle.subHeading,
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AllColors.bluecolor,
                      ),
                      onPressed: () {
                        if (titlecontrollar.text.isEmpty &&
                            descriptionController.text.isEmpty) {
                          print("is empty.fist fill up.fist");
                        } else {
                          DateTime now = DateTime.now();
                          String readableDate =
                              DateFormat('EEEE, MMM d, yyyy').format(now);
                          homeControllar.editnote(
                              notemodel(
                                  titlecontrollar.text,
                                  descriptionController.text,
                                  readableDate.toString()),
                              index);
                        }
                        titlecontrollar.clear();
                        descriptionController.clear();
                        Navigator.pop(context);
                      },
                      child: Text('update', style: AllStyle.subHeading))
                ],
              ),
            ),
          );
        });
  }
}
