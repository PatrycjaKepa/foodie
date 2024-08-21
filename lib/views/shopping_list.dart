import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie/components/new_element_list.dart';
import 'package:foodie/components/new_item_shopping_list.dart';
import 'package:foodie/main.dart';
import 'package:foodie/reusable/time_now.dart';
import 'package:http/http.dart' as http;

import '../models/shopping_list_title.dart';

class ShoppingList extends StatefulWidget {
ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final shoppingList = ShoppingItem.shoppingList();
  List<ShoppingItem>_foundList = [];
  final _shoppingController = TextEditingController();
  String title = '';
  final done = false;
  

  Future sendPost() async {
    final url = Uri.parse('http://$ADRES:8080/api/v1/shopping-list');
    final res = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'authorization': ACTIVE_USER.getAuthenticationKey(),
          },
        body: json.encode({'title': title, 'isDone': done}));

        if(res.statusCode == 200) {
          print('d');
        }
        print(res.statusCode);
  }

  Future activeList() async {
    final uri = Uri.parse('http://$ADRES:8080/api/v1/shopping-list');
    final res = await http.get(uri,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'authorization': ACTIVE_USER.getAuthenticationKey(),
        });
        if(res.statusCode == 200) {
          List activeList = json.decode(res.body);
          setState(() {
          for(var item in activeList) {
              // _addToDoItem(item.title);
              shoppingList.add(ShoppingItem.fromJson(item));
          }});
        }
  }

    Future deleteItem(String id) async {
    final url = Uri.parse('http://$ADRES:8080/api/v1/shopping-list/$id');
    final res = await http.delete(url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'authorization': ACTIVE_USER.getAuthenticationKey(),
        });

    if (res.statusCode == 200) {
      print('Item deleted successfully');
    } else {
      print('Error: ${res.statusCode}');
    }
  }

  @override
  void initState() {
    _foundList = shoppingList;
    super.initState();
    activeList();
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
                        child: Text('Lista zakupów',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      )
                      ],),

                    for(ShoppingItem item in _foundList.reversed)
                    NewShoppingItem(
                      todoItem: item,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                      ),
                  ],
                ),]
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 20),
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
                          controller: _shoppingController,
                          decoration: InputDecoration(
                            hintText: 'Dodaj',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: (){
                            _addToDoItem(_shoppingController.text);
                            sendPost();
                          }, 
                          child: 
                          Text(
                            '+', 
                          style: TextStyle(
                            fontSize: 40, 
                            color: Colors.blue[100]
                            ),
                            ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(60, 60),
                            elevation: 0,
                          ),
                          ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

void  _handleToDoChange(ShoppingItem done) {
  setState(() {
    done.isDone = !done.isDone;
  });
}

void _deleteToDoItem(String id) {
  deleteItem(id);
  setState(() {
  shoppingList.removeWhere((item) => item.id == id);
  });
}

void _addToDoItem(String toDo) {
  setState(() {
     shoppingList.add(ShoppingItem
      (id: DateTime.now().millisecondsSinceEpoch.toString(), 
      title: toDo,
      ));
      title = toDo;
  });
  _shoppingController.clear();
}
}