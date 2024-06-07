import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationCard extends StatefulWidget {
  const RegistrationCard({super.key});

  @override
  State<RegistrationCard> createState() => _RegistrationCardState();
}

class _RegistrationCardState extends State<RegistrationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      decoration: BoxDecoration(color: Colors. black26,borderRadius: BorderRadius.circular(20),),
      height: MediaQuery.of(context).size.height - 50,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Text("Zarejestruj się",
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
              const SizedBox(
                height: 20,
              ),
            ],
          ),

          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: "Nazwa użytkownika",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  prefixIcon: const Icon(Icons.person, color: Colors.white,)
                ),
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),

          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  prefixIcon: const Icon(Icons.email, color: Colors.white,)
                ),
              )
            ],
          ),

          Column(
            children: [
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
              )
            ],
          ),

          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: "Potwierdź hasło",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  prefixIcon: const Icon(Icons.password, color: Colors.white,)
                ),
              )
            ],
          ),

          Container(
            padding: const EdgeInsets.only(top: 3, left: 3),
            child: ElevatedButton(onPressed: (){}, 
            child: Text("Zarejestruj się",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(vertical: 16),
              // shadowColor: Colors.transparent,
              backgroundColor: Color.fromARGB(255, 144, 213, 255),
            ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Masz już konto?", style: TextStyle(color: Colors.white)),
              TextButton(onPressed: (){}, 
              child: Text('Zaloguj się',
              style: TextStyle(color: Color.fromARGB(255, 144, 213, 255))))
            ],)
        ],
      ),
    );
  }
}
