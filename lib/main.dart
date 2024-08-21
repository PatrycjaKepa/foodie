import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/reusable/activeUser.dart';
import 'package:foodie/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';


const ADRES = '192.168.1.144';

// String EMAIL = 'user1';
// String PASSWORD = 'password';
// String basicAuth = 'Basic ' + base64Encode(utf8.encode('$EMAIL:$PASSWORD'));
ActiveUser ACTIVE_USER = new ActiveUser(email: '', password: '');

void main() {
setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "router",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}