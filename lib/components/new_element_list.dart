import 'package:flutter/material.dart';
import 'package:foodie/models/recipe_list.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onDeleteItem;
  final onToDoChanged;

  const ToDoItem ({super.key, required this.todo, required this.onDeleteItem, required this.onToDoChanged});

  Widget build (BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 162, 215, 250),
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        onTap: () {
          print('click');
          onToDoChanged(todo);
        },
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank, 
          color: Colors.blue[100],),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            decoration: TextDecoration.lineThrough,
          ),
          ),
          trailing: Container(
            alignment: Alignment.center,
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: () {
                print('delete');
                onDeleteItem(todo.id);
              },
            ),
          ),
      ),
    );
  }
}