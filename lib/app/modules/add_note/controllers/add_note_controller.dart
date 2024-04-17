import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNoteController extends GetxController {
  // final database = NoteDatabase();

  TextEditingController titleC = TextEditingController();
  TextEditingController subtitleC = TextEditingController();

  // Future<void> addNote() async {
  //   database.insertNote(
  //     Note(
  //       title: titleC.text, 
  //       subtitle: subtitleC.text
  //     )
  //   );
  //   Get.back();
  // }

}