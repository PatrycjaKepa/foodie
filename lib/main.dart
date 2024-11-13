import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/user/active_user.dart';
import 'package:foodie/routesAndOthers/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';


const ADRES = '192.168.1.144';

// String EMAIL = 'user1';
// String PASSWORD = 'password';
// String basicAuth = 'Basic ' + base64Encode(utf8.encode('$EMAIL:$PASSWORD'));
ActiveUser ACTIVE_USER = ActiveUser(email: '', password: '');

void main() {
setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "router",
      theme: ThemeData(
        fontFamily: '${GoogleFonts.roboto}',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}