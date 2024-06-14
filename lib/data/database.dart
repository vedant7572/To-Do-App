import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  final _mybox = Hive.box('mybox');

  //this function is for when the user opens the app for the first time
  void createInitialdata() {
    toDoList=[
      ["Watch Flutter",false],
      ["Do 5 questions",true],
    ];
  }

  //load data from the database
  void loadData() {
    toDoList=_mybox.get("TODOLIST");
  }

  void updateData() {
    _mybox.put("TODOLIST",toDoList);
  }

}
