import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/views/login.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ActiveUser {
  String email;
  String password;

  ActiveUser({required this.email, required this.password});

  String getAuthenticationKey() {
    String password = this.password;
    return 'Basic ' + base64Encode(utf8.encode(this.email + ':$password'));
  }

  void setAuthenticationData(String email, String password) {
    if (this.email.isNotEmpty || this.password.isNotEmpty) {
      throw new Exception('User is logged in');
    }
    this.email = email;
    this.password = password;
  }
  
  void removeAuthenticationData() {
    this.email = '';
    this.password = '';
  }

}