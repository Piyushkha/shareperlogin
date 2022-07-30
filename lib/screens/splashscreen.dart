import 'dart:async';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login.dart';
import 'package:instagram_clone/screens/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    Timer(Duration(milliseconds: 1500), mycheckvalue);
  }

  Future<void> mycheckvalue() async {
    // WidgetsFlutterBinding.ensureInitialized();

    SharedPreferences per = await SharedPreferences.getInstance();
    var email = per.getString('email');
    print(email);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => email == null ? LoginPage() : Mainpage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/logobottom.png'),
            height: 100,
          )
        ],
      ),
      body: Center(
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
