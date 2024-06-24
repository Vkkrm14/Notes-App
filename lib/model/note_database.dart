import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/model/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{
  static late Isar isar;

  //initialize
static Future<void> initialize() async{
  final dir=await getApplicationDocumentsDirectory();
  isar =await Isar.open([NoteSchema], directory: dir.path);
}

  //list pf notes
  final List<Note> currentNotes=[];
  //create
  Future<void> addNote(String text)async{
    final newNote=Note()..text=text;
    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote));
    //re-read
    fetchNotes();
  }

  //read
  Future<void> fetchNotes()async{
    List<Note> fetchedNotes=await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
}

  //update

  Future<void> updateNote(int id,String newtext) async{
    final existingNote=await isar.notes.get(id);
    if(existingNote!=null){
      existingNote.text=newtext;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      //re-read
      await fetchNotes();

    }
  }

  //delete
Future<void> deleteNote(int id) async{
    await isar.writeTxn(() => isar.notes.delete(id));
    //re-raed
  fetchNotes();
}
}