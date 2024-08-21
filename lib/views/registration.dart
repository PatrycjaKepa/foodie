import 'package:flutter/material.dart';
import 'package:foodie/main.dart';
import 'package:foodie/reusable/time_now.dart';
import 'dart:convert';
import 'package:foodie/models/user.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_regex/flutter_regex.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();

  User user = User("", "", "", "");
  final uri = Uri.parse('http://$ADRES:8080/api/v1/user/register');

  Future save() async {
    ACTIVE_USER.setAuthenticationData(user.email, user.password);
    print(user.email);
    print(user.password);
    final res = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
          },
        body: json.encode({
          'username': user.login,
          'email': user.email,
          'password': user.password,
          'confirmPass': user.confirmPass
        }));
    if (res.statusCode == 200) {
      setState(() {
        print(res.statusCode);
        context.go('/login');
      });
    }else{
      print(user.email);
      print(res.statusCode);
    }
  }

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
            children: [
              const TimeNow(),
              Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height - 50,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Zarejestruj się",
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextFormField(
                          controller: TextEditingController(text: user.login),
                          onChanged: (val) {
                            user.login = val;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Nazwa użytkownika jest pusta';
                            }
                            else if(!value.isUsername()) {
                              return 'Nazwa musi posiadać 3-15 znaków';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.white),
                              hintText: "Nazwa użytkownika",
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
                        )
                      ],
                    ),
                    Column(
                      children: [
                        TextFormField(
                          controller: TextEditingController(text: user.email),
                          onChanged: (val) {
                            user.email = val;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Email jest pusty';
                            }
                            else if(!value.isEmail()) {
                              return 'To nie jest email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.white),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.white30,
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              )),
                              style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        TextFormField(
                          controller: TextEditingController(text: user.password),
                          onChanged: (val) {
                            user.password = val;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Hasło nie może być puste';
                            }
                            else if(!value.isPasswordHard()) {
                              return 'Hasło musi zaczynać się z dużej litery, posiadać cyfry i znak specjalny, minimum 8 znaków';
                            }
                            return null;
                          },
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.white),
                              hintText: "Hasło",
                              suffixIcon: GestureDetector(
                                onTap: _togglePasswordView,
                                child: Icon(
                                   _isHidden ? Icons.visibility : Icons.visibility_off, 
                                   color: Colors.white,),
                                   ),
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
                        )
                      ],
                    ),
                    Column(
                      children: [
                        TextFormField(
                          controller: TextEditingController(text: user.confirmPass),
                          onChanged: (val) {
                            user.confirmPass = val;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Nie potwierdzono hasła';
                            }
                            if(value != user.password) {
                              return 'Hasło się różni';
                            }
                            return null;
                          },
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.white),
                              hintText: "Potwierdź hasło",
                              suffixIcon: GestureDetector(
                                onTap: _togglePasswordView,
                                child: Icon(
                                   _isHidden ? Icons.visibility : Icons.visibility_off, 
                                   color: Colors.white,),
                                   ),
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
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            save();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          // shadowColor: Colors.transparent,
                          backgroundColor: Color.fromARGB(255, 144, 213, 255),
                        ),
                        child: const Text(
                          "Zarejestruj się",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Masz już konto?", style: TextStyle(color: Colors.white)),
                        TextButton(
                            onPressed: () async {
                              context.go('/login');
                            },
                            child: const Text('Zaloguj się',
                                style:
                                    TextStyle(color: Color.fromARGB(255, 144, 213, 255))))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
    );
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
}
}