// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:foodie/components/new_item_shopping_list.dart';
// import 'package:foodie/main.dart';
// import 'package:foodie/models/shopping_list_title.dart';
// import 'package:foodie/reusable/time_now.dart';
// import 'package:http/http.dart' as http;

// class ShoppingList extends StatefulWidget {
//   const ShoppingList ({super.key});

//   @override
//   State<ShoppingList> createState() => _ShoppingListState();
// }

// class _ShoppingListState extends State<ShoppingList> {
//   bool _isLoading = true;
//   String? _error;
//   @override
//   void initState() {
//     _loadItems();
//     super.initState();
//   }
  
//   List<ShoppingItem> _shoppingItems = [];

//   void _loadItems() async {
//     final url = Uri.parse('http://$ADRES:8080/api/v1/shopping-list');

//   try {
//     String a = "user1";
//     String b = "password";
//     final res = await http.get(url, headers: {'authorization': basicAuth},);
//     if(json.decode(res.body) == 'null') {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//     if(res.statusCode == 400) {
//       setState(() {
//         _error = 'Unable to show data please try again later 1';
//       });
//     }
//     final List<dynamic> listData = jsonDecode(res.body);
//     final List<ShoppingItem> loadedItems = [];

//     for(var item in listData) {
//       loadedItems.add(ShoppingItem(id: "$item['id']", title: "$item"));
//     }
//     setState(() {
//       _shoppingItems = loadedItems;
//       _isLoading = false;
//     });
//   }catch (e) {
//     setState(() {
//       _error = 'Unable to show data please try again later 2';
//     });
//   }
//   }

//   void _addItem() async {
//     final newItem = await Navigator.of(context).push(
//       MaterialPageRoute(builder: (ctx) => const NewItem(),
//       ),
//     );
//     if(newItem == null) {
//       return;
//     }
//     setState(() {
//       _shoppingItems.add(newItem);
//     });
//   }

//   void _removeItem(ShoppingItem item) async {
//     final index = _shoppingItems.indexOf(item);
//     setState(() {
//       _shoppingItems.remove(item);
//     });
//     final url = Uri.http('http://$ADRES:8080/api/v1/shopping-list');
//     final res = await http.delete(url, headers: {'authorization': basicAuth});
//     if(res.statusCode >= 400) {
//       setState(() {
//         _shoppingItems.insert(index, item);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget content = Center(
//       child: Text('Lista jest pusta'),
//     );

//     if(_isLoading) {
//     content = const Center(
//       child: CircularProgressIndicator(),
//     );
//   }

// print(_shoppingItems[0].title);
//   if(_shoppingItems.isNotEmpty) {
//     content = ListView.builder(
//       itemCount: _shoppingItems.length,
//       itemBuilder: (context, index) {
//         final item = _shoppingItems[index];
//         return Card(
//         child: ListTile(
//           title: Text(item.title),
//           leading: Container(
//             height: 24,
//             width: 24,
//             color: Colors.red,
//           ),
//       ));}
//         );
//   }

//    if(_error != null) {
//     content = Center(
//       child: Text(_error!),
//     );
//    }
//    return Scaffold(
//     appBar: AppBar(
//       title: Text('Twoje Zakupy'),
//       actions: [
//         IconButton(onPressed: _addItem, icon: Icon(Icons.add)),
//       ],
//     ),
//     body: Center(
//           child: Container(
//         width: double.infinity,
//         child: Stack(children: [
//           TimeNow(),
//           content,
//         ]),
//       )),
//    );
//   }
// }