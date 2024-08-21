import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie/main.dart';
import 'package:foodie/models/user.dart';
import 'package:foodie/reusable/time_now.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String activeEmail = '';
  String activePassword = '';

  bool visible = false;

  User user = User("", "", "", "");
  final uri = Uri.parse('http://$ADRES:8080/api/v1/user/login');

  Future login() async {
    ACTIVE_USER.setAuthenticationData(user.email, user.password);
    final res = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'authorization': ACTIVE_USER.getAuthenticationKey(),
          },
        body: json.encode({'email': user.email, 'password': user.password}));
    if (res.statusCode == 200) {
      setState(() {
        context.go('/mainscreen');
      });
    } else {
      ACTIVE_USER.removeAuthenticationData();
      setState(() {
        visible = true;
      });
    }
    return print(res.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          TimeNow(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _header(context),
                    Visibility(
                      visible: visible,
                      child: Text('test', style: TextStyle(color: Colors.red),),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller:
                                  TextEditingController(text: user.email),
                              onChanged: (val) {
                                  user.email = val;
                                  activeEmail = val;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Musisz uzupełnić email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.white30,
                                  filled: true,
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  )),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:
                              TextEditingController(text: user.password),
                              onChanged: (val) {
                                  user.password = val;
                                  activePassword = val;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Musisz uzupełnić hasło';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  hintText: "Hasło",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.white30,
                                  filled: true,
                                  prefixIcon: const Icon(
                                    Icons.password,
                                    color: Colors.white,
                                  )),
                                  style: const TextStyle(color: Colors.white),
                              obscureText: false,
                              
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.only(top: 3, left: 3),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    login();
                                    // context.go('/mainscreen');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  // shadowColor: Colors.transparent,
                                  backgroundColor:
                                      Color.fromARGB(255, 144, 213, 255),
                                ),
                                child: const Text(
                                  "Zaloguj się",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Zapomniałeś hasła?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              context.go('/remindYourself');
                            },
                            child: const Text(
                              "Przypomnij sobie !",
                              style: TextStyle(
                                color: Color.fromARGB(255, 144, 213, 255),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Nie masz jeszcze konta?",
                              style: TextStyle(color: Colors.white)),
                          TextButton(
                              onPressed: () => context.go('/registration'),
                              child: const Text(
                                "Zarejestruj się",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 144, 213, 255),
                                ),
                              ))
                        ],
                      )
                    ]),
                  ])),
        ]),
      ),
    );
  }
}

_header(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Cześć \nMiło cię widzieć",
        style: GoogleFonts.roboto(
            textStyle: const TextStyle(fontSize: 35, color: Colors.white)),
      ),
    ],
  );
}
