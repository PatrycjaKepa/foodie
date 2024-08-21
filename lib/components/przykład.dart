import 'package:flutter/material.dart';
import 'package:foodie/components/new_element_list.dart';
import 'package:foodie/models/recipe_list.dart';
import 'package:foodie/reusable/time_now.dart';

class PP extends StatefulWidget {
PP({super.key});

  @override
  State<PP> createState() => _PPState();
}

class _PPState extends State<PP> {
  final todosList = ToDo.todoList();
  List<ToDo>_foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            TimeNow(),
            searchBox(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 110),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: ListView(
                children: [Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text('Przepisy',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      )
                      ],),

                    for(ToDo todoo in _foundToDo.reversed)
                    ToDoItem(
                      todo: todoo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                      ),
                  ],
                ),]
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                          hintText: 'Dodaj przepis',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: (){
                          _addToDoItem(_todoController.text);
                        }, 
                        child: Text('+', style: TextStyle(fontSize: 40, color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[100],
                          minimumSize: Size(60, 60),
                          elevation: 10,
                        ),
                        ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

void  _handleToDoChange(ToDo todo) {
  setState(() {
    todo.isDone = !todo.isDone;
  });
}

void _deleteToDoItem(String id) {
  setState(() {
  todosList.removeWhere((item) => item.id == id);
  });
}

void _addToDoItem(String toDo) {
  setState(() {
     todosList.add(ToDo
      (id: DateTime.now().millisecondsSinceEpoch.toString(), 
      todoText: toDo
      ));
  });
  _todoController.clear();
}

void _runFilter(String enteredKeyword) {
  List<ToDo> results = [];
  if(enteredKeyword.isEmpty) {
    results = todosList;
  }else {
    results = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
  }
  setState(() {
    _foundToDo = results;
  });
}

Widget searchBox() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 350,
        height: 50,
        padding: EdgeInsets.only(left: 10),
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 25),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.grey,
              )),
        ),
      ),
    ],
  );
}
}

_horizontalLine(context) {
  return SizedBox(
    width: 320,
    child: Divider(
      color: Colors.grey,
      thickness: 1,
    ),
  );
}
