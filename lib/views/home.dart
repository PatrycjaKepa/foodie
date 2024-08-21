import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/components/settings.dart';
import 'package:foodie/main.dart';
import 'package:foodie/reusable/time_now.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';

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
    } else {
      name = 'guest';
    }
  }

  @override
  Widget build(BuildContext context) {
    print(name);
    return Scaffold(
      body: Center(
        child: Stack(children: [
          TimeNow(),
          Container(
            width: double.infinity,
            child: Column(children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.account_box_rounded),
                  ],
                ),
              ),
              Container(
                child: Row(children: [
                  Text(
                    'Cześć $name',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                ),
            ),
            child: Settings(),
          )
        ]),
      ),
    );
  }
}
