import 'package:drift_db/app/data/db/note_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();  
  // final database = NoteDatabase();
  // await database.into(database.notes).insert(NotesCompanion.insert(title: "Title", subtitle: "Subtitle"));
  // List<Note> allNotes = await database.select(database.notes).get();
  // print("${allNotes}");

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
