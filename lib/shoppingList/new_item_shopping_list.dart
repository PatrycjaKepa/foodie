import 'package:flutter/material.dart';
import 'package:foodie/shoppingList/shopping_list_title.dart';

class NewShoppingItem extends StatelessWidget {
  final ShoppingItem todoItem;
  final dynamic onDeleteItem;
  final dynamic onToDoChanged;

  const NewShoppingItem ({super.key, required this.todoItem, required this.onDeleteItem, required this.onToDoChanged});

  @override
  Widget build (BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 219, 242, 255),
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        onTap: () {
          onToDoChanged(todoItem);
        },
        leading: Icon(
          todoItem.isDone ? Icons.check_box : Icons.check_box_outline_blank, 
          color: Colors.green),
        title: Text(
          todoItem.title,
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
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDeleteItem(todoItem.id);
              },
            ),
          ),
      ),
    );
  }
}