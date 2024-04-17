import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'note_database.g.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get title => text()();
  TextColumn get subtitle => text()();
}
@DriftDatabase(tables: [Notes])
class NoteDatabase extends _$NoteDatabase {
  NoteDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  // Fetch
  Future<List<Note>> fetchAllNotes() => select(notes).get();

  // Stream
  Stream<List<Note>> streamAllNotes() => select(notes).watch();

  // Update
  Future<bool> editNote(Note note) => update(notes).replace(note);

  // Delete
  Future<int> deleteNote(Note note) => delete(notes).delete(note);

  // Insert
  Future<int> insertNote(Note note) => into(notes).insert(note);
}

LazyDatabase _openConnection(){
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

