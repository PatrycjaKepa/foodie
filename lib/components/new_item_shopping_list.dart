import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie/main.dart';
import 'package:foodie/models/recipe_list.dart';
import 'package:foodie/models/shopping_list_title.dart';
import 'package:http/http.dart' as http;

class NewShoppingItem extends StatelessWidget {
  final ShoppingItem todoItem;
  final onDeleteItem;
  final onToDoChanged;

  const NewShoppingItem ({super.key, required this.todoItem, required this.onDeleteItem, required this.onToDoChanged});

  Widget build (BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 219, 242, 255),
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        onTap: () {
          print('click');
          onToDoChanged(todoItem);
        },
        leading: Icon(
          todoItem.isDone ? Icons.check_box : Icons.check_box_outline_blank, 
          color: Colors.green),
        title: Text(
          todoItem.title!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            decoration: todoItem.isDone ? TextDecoration.lineThrough : null,
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
                onDeleteItem(todoItem.id);
              },
            ),
          ),
      ),
    );
  }
}