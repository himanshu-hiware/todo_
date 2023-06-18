import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/util/dialogBox.dart';
import 'package:todo/util/todo_tile.dart';

import '../data/database.dart';


class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  final my_box = Hive.box('mybox');
  void initState() {
    //if this is 1st time for  app to open
   setState(() {
     if(my_box.get('todolist') == null){
       db.createIntialData();
     }
     else{
       //not the 1st time
       db.loadData();
     }
   });
   db.updateDatabase();
  }

  //text controler
  final _controler = TextEditingController();


  TodoDatabase db = TodoDatabase();
  //function to craet checkbox
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toList[index][1]=!db.toList[index][1];
      db.updateDatabase();
    });

  }

  void saveNewtask(){
    db.toList.add([_controler.text,false]);
    setState(() {
      _controler.clear();
      Navigator.of(context).pop();
    });
    db.updateDatabase();

  }

  void createTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controler: _controler,
            onSave: saveNewtask,
            onCancle: () => Navigator.of(context).pop(),
          );
        }
        );

  }
  void deleteTask(int index){
    setState(() {
      db.toList.removeAt(index);
    });
    db.updateDatabase();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade300,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("ToDo",
          textAlign: TextAlign.center,
          selectionColor: Colors.white,
          
          
        ),

        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toList.length,
        itemBuilder: (context, index){
          return TodoTile(
              taskname: db.toList[index][0],
              taskstatus: db.toList[index][1],
              onChanged: (value)=> checkBoxChanged(value,index),
              deltask: (BuildContext)=> deleteTask(index));
        },

      ),
    );
  }
}
