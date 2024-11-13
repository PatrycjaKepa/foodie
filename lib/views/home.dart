import 'package:flutter/material.dart';
import 'package:foodie/main.dart';
import 'package:go_router/go_router.dart';
import 'package:foodie/routesAndOthers/time_now.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'Jane Doe';
  bool val = false;
  IconData mode = Icons.dark_mode_rounded;
  String modeTitle = 'Ciemny tryb';

  onSwitched(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  @override
  void initState() {
    super.initState();
    data();
  }

  Future data() async {
    final url = Uri.parse('http://$ADRES:8080/api/v1/user/name');
    final res = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'authorization': ACTIVE_USER.getAuthenticationKey()
      },
    );
    if (res.statusCode == 200) {
      setState(() {
        name = res.body;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          const TimeNow(),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.grey[600],
                            size: 100,
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Cześć, $name',
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(mode),
                                ),
                                Text(modeTitle),
                              ], 
                            ),
                            Switch(
                                value: val,
                                activeColor: Colors.blue.withOpacity(0.5),
                                onChanged: (newVal) {
                                  onSwitched(newVal);
                                  if (newVal) {
                                    mode = Icons.light_mode;
                                    modeTitle = 'Jasny tryb';
                                  } else {
                                    mode = Icons.dark_mode_rounded;
                                    modeTitle = 'Ciemny tryb';
                                  }
                                }),
                          ],
                        ),
                      ),
                      const ButtonBuild('Powiadomienia', ''),
                      const ButtonBuild('Historia wyświetlania', ''),
                      const ButtonBuild('Wiadomości', ''),
                      const SizedBox(
                        height: 20,
                      ),
                      const ButtonBuild('Edytuj profil', ''),
                      const ButtonBuild('FAQ', ''),

                      const ButtonBuild('test', ''),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        children: [
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  backgroundColor: Colors.blue.withOpacity(0.5),
                                  elevation: 0,
                                ),
                                child: const SizedBox(
                                  width: 440,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Icon(
                                          Icons.exit_to_app_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'WYLOGUJ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ButtonBuild extends StatelessWidget {
  final String name;
  final String path;
  const ButtonBuild(this.name, this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go(path),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                backgroundColor: Colors.white,
                overlayColor: Colors.blue,
                shadowColor: Colors.transparent,
              ),
              child: SizedBox(
                width: 440,
                child: Text(
                  name,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}