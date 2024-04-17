import 'package:drift_db/app/data/db/note_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  
  final database = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNoteView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.titleC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller.subtitleC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Subtitle",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              database.insertNote(
                Note(
                  title: controller.titleC.text, 
                  subtitle: controller.subtitleC.text
                ));
                Get.back();
            }, child: Text('Save'))
          ],
        ),
      )
    );
  }
}
