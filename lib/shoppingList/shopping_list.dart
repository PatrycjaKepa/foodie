import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodie/shoppingList/new_item_shopping_list.dart';
import 'package:foodie/main.dart';
import 'package:foodie/routesAndOthers/time_now.dart';
import 'package:http/http.dart' as http;

import 'shopping_list_title.dart';

class ShoppingList extends StatefulWidget {
const ShoppingList({super.key});

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
        body: json.encode({'title': title, 'isDone': done}),
    );
    if(res.statusCode != 200) {
      throw Exception('Error posting item: ${res.statusCode}');
    }
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

    if (res.statusCode != 200) {
      throw Exception('Error: ${res.statusCode}');
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
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            const TimeNow(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 110),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: ListView(
                children: [Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
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
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _shoppingController,
                          decoration: const InputDecoration(
                            hintText: 'Dodaj',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: (){
                            _addToDoItem(_shoppingController.text);
                            sendPost();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(60, 60),
                            elevation: 0,
                          ), 
                          child: 
                          Text(
                            '+', 
                          style: TextStyle(
                            fontSize: 40, 
                            color: Colors.blue[100]
                            ),
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