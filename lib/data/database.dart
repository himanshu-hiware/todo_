import 'package:hive_flutter/hive_flutter.dart';


class TodoDatabase{

  List toList =[];

  //reference the box
  final my_box= Hive.box('mybox');

  void createIntialData(){
    toList= [
      ["code",false],
      ["gym",false],
    ];
  }

  void loadData(){
    toList= my_box.get('todolist');

  }

  void updateDatabase(){
  my_box.put('todolist',toList);
  }
}