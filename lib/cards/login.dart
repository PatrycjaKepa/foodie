import 'package:flutter/material.dart';
import 'package:foodie/reusable/buttons.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginCard extends StatelessWidget{
  const LoginCard ({super.key});

  @override
  Widget build (BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
      decoration: BoxDecoration(color: Colors. black26,borderRadius: BorderRadius.circular(20),),
      height: MediaQuery.of(context).size.height - 50,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _header(context),
          _inputFiled(context),
          Column(
            children: [
            _forgotPassword(context),
            _signUp(context)],),
        ],),
    );
  }
}

_header(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("Cześć \nMiło cię widzieć",
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 30,
          color: Colors.white
        )
      ),),
    ],);
}

_inputFiled(context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          hintText: "Login",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          ),
          fillColor: Colors.white30,
          filled: true,
          prefixIcon: const Icon(Icons.person, color: Colors.white,)
        ),
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(height: 10,),
      TextField(
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
          hintText: "Hasło",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          ),
          fillColor: Colors.white30,
          filled: true,
          prefixIcon: const Icon(Icons.password, color: Colors.white,)
        ),
        obscureText: false,
      ),
      const SizedBox(height: 20),
      const RedirectButton("Login", '/mainscreen'),
    ],
  );
}

_forgotPassword(context){
  return Row(
    children: [
      Text("Zapomniałeś hasła?", style: TextStyle(color: Colors.white),),
      TextButton(onPressed: () => context.go('/home'), 
      child: const Text("Przypomnij sobie !", 
      style: TextStyle(color: Color.fromARGB(255, 144, 213, 255),),),
      ),
    ],
  );
}

_signUp(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Text("Nie masz jeszcze konta?", style: TextStyle(color: Colors.white)),
      TextButton(onPressed: () => context.go('/registration'), 
      child: const Text("Zarejestruj się", 
      style: TextStyle(color: Color.fromARGB(255, 144, 213, 255),),)
      )
    ],
  );
}