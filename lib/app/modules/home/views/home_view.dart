import 'package:drift_db/app/data/db/note_database.dart';
import 'package:drift_db/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  
  final database = NoteDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: database.streamAllNotes(),
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            Note note = snapshot.data![index];
            return ListTile(
              onTap: () {
                Get.toNamed(Routes.EDIT_NOTE, arguments: {
                  'note': note,
                  'database': database
                });
              },
              leading: CircleAvatar(
                child: Text('${note.id}'),
              ),
              title: Text('${note.title}'),
              subtitle: Text('${note.subtitle}'),
              trailing: IconButton(icon: Icon(Icons.delete), onPressed: (){
                database.deleteNote(note);
              },),
            );
        },),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(Routes.ADD_NOTE, arguments: database);
      }, child: Text('+'),),
    );
  }
}
