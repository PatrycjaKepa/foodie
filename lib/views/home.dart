import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/reusable/time_now.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(children: [
            TimeNow(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              // decoration: BoxDecoration(color: Colors. black26,borderRadius: BorderRadius.circular(20),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _profile(context),
                  _recentlyViewed(context),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

_profile(context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_circle_rounded),
                iconSize: 50,
                color: Colors.grey,
              ),
              Text(
                'Cześć, Name',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Wyświetlono'),
                Text('00'),
              ],
            ),
            Column(
              children: [
                Text('Zaobserwowano'),
                Text('00'),
              ],
            ),
            Column(
              children: [
                Text('Dodano'),
                Text('00'),
              ],
            )
          ],
        )
      ],
    ),
  );
}

_recentlyViewed(context) {
  return Container(
    width: double.infinity,
    // margin: EdgeInsets.symmetric(vertical: 30),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        const Row(
          children: [
            Text(
              'Ostatnio wyświetlane',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text('Image'),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text('Image'),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text('Image'),
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [_ustawienia(context)],
            ),
          ),
        ),
      ],
    ),
  );
}

_ustawienia(context) {
  return Container(
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Text(
        'Ustawienia',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      _horizontalLine(context),
      TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.assistant, color: Colors.black87),
            ),
            Text('Powiadomienia',
            style: TextStyle(
              color: Colors.black87
            ),),
          ],
        ),
      ),
      _horizontalLine(context),
      TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.app_shortcut_rounded, color: Colors.black87),
            ),
            Text('Historia wyświetlania',
            style: TextStyle(
              color: Colors.black87
            ),),
          ],
        ),
      ),
      _horizontalLine(context),
      TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.note_alt_rounded, color: Colors.black87),
            ),
            Text('Notatki',
            style: TextStyle(
              color: Colors.black87
            ),),
          ],
        ),
      ),
       _horizontalLine(context),
      TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.settings_applications_rounded, color: Colors.black87),
            ),
            Text('Ustawienia',
            style: TextStyle(
              color: Colors.black87
            ),
            ),
          ],
        ),
      ),
    ]),
  );
}

_horizontalLine(context){
  return SizedBox(
          width: 320,
          child: Divider(
            color: Colors.grey,
            thickness: 1,),
        );
}