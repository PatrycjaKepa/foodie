import 'dart:convert';

import 'package:foodie/main.dart';
import 'package:http/http.dart' as http;

class ShoppingItem {
  String id;
  String title;
  bool isDone;

  ShoppingItem({
    required this.id,
    required this.title,
    this.isDone = false
  });

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      id: json['id'].toString(),
      title: json['title'],
      isDone: json['done'] ?? false,
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };}
  
  static List<ShoppingItem> shoppingList() {
  return [
  ];
}
}