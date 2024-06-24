// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/components/my_drawer.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/model/note_database.dart';
import 'package:provider/provider.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final textcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    //on app start up,get existing notes
    readNotes();
  }
  //create notes
  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textcontroller,
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    //add to database
                    context.read<NoteDatabase>().addNote(textcontroller.text);
                    //clear controller
                    textcontroller.clear();
                    //pop
                    Navigator.pop(context);
                  },
                  child: Text('Create'),
                )
              ],
            ));
  }

  //read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update notes
  void updateNotes(Note note){
    textcontroller.text=note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textcontroller,
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                //add to database
                context.read<NoteDatabase>().updateNote(note.id, textcontroller.text);
                //clear controller
                textcontroller.clear();
                //pop
                Navigator.pop(context);
              },
              child: Text('Update'),
            )
          ],
        ));

  }

  //delete notes
  void deleteNote(int id){
    context.read<NoteDatabase>().deleteNote(id);
  }
  @override
  Widget build(BuildContext context) {
    //note database
    final notedatabase = context.watch<NoteDatabase>();
    //get the current note
    List<Note> currentNotes = notedatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: createNote,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Notes",style: GoogleFonts.dmSerifText(fontSize: 45,color:Theme.of(context).colorScheme.inversePrimary)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
                itemBuilder: (context, index){
                  final note=currentNotes[index];
                  //UI
                 return Container(
                   decoration: BoxDecoration(color: Theme.of(context).colorScheme.background,
                   borderRadius: BorderRadius.circular(12)),
                   margin: EdgeInsets.only(left: 25,right: 25,top: 10),
                   child: ListTile(
                     title: Text(note.text),
                     trailing: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         //edit button
                         IconButton(onPressed:()=> updateNotes(note), icon: Icon(Icons.edit)),

                         //delete button
                         IconButton(onPressed:()=> deleteNote(note.id), icon: Icon(Icons.delete)),
                       ],
                     ),
                   ),
                 );
                }),
          ),
        ],
      ),
    );
  }
}
