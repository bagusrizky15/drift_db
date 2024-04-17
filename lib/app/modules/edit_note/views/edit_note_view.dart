import 'package:drift_db/app/data/db/note_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {

  Note note = Get.arguments['note'];
  NoteDatabase database = Get.arguments['database'];

  @override
  Widget build(BuildContext context) {

    controller.titleC.text = note.title;
    controller.subtitleC.text = note.subtitle;

    return Scaffold(
      appBar: AppBar(
        title: const Text('EditNoteView'),
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
              database.editNote(
                Note(
                  id: note.id,
                  title: controller.titleC.text,
                  subtitle: controller.subtitleC.text
                )
              );
              Get.back();
            }, child: Text('Save'))
          ],
        ),
      )
    );
  }
}
