import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mainpage extends StatefulWidget {
  Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  String? text;
  Future<void> value() async {
    SharedPreferences per = await SharedPreferences.getInstance();

    setState(() {
      text = per.getString('email');
    });
    print(text);
  }

  logout() async {
    SharedPreferences per = await SharedPreferences.getInstance();
    per.remove('email');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text.toString()),
          ElevatedButton(onPressed: logout, child: Text('Log Out'))
        ],
      ),
    );
  }
}
