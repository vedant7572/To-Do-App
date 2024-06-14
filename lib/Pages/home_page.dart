import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/util/dialog_box.dart';
import 'package:to_do/util/todo_tile.dart';

import '../data/database.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox=Hive.box('mybox');
  ToDoDatabase db=ToDoDatabase();

  @override
  void initState() {
    
    if(_mybox.get("TODOLIST")==null){
      db.createInitialdata();
    }
    else{
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //text controller
  final _controller = TextEditingController();

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void cancelDialogBox() {
    Navigator.of(context).pop();
  }

  void createNewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: cancelDialogBox,
          );
        });
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: Center(child: Text("To Do ")),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewtask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteFunction: (context)=>deleteTask(index),
            );
          },
        ));
  }
}
