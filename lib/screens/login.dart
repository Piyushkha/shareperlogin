// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/mainpage.dart';
import 'package:instagram_clone/screens/share_preffrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool istap = false;
// bool isopen = true;

class _LoginPageState extends State<LoginPage> {
  @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   istap = isopen;
  // }
  TextEditingController _usernamecon = TextEditingController();
  TextEditingController _passwordcon = TextEditingController();
  var _per;

  void initState() {
    // TODO: implement initState
    super.initState();
    istap = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("English")),
            SizedBox(height: 35),
            Container(
                height: 50,
                child: Center(
                    child: Image(
                  image: AssetImage('assets/images/name.png'),
                  filterQuality: FilterQuality.low,
                ))),
            SizedBox(height: 25),
            Container(
                padding: EdgeInsets.all(4),
                child: TextField(
                  // showCursor: false,
                  controller: _usernamecon,

                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: 'Phone numbeer,username or email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.black38, width: 3))),
                )),
            Container(
                padding: EdgeInsets.all(4),
                child: TextField(
                  obscureText: !istap,
                  // showCursor: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: !istap ? Icon(Icons.lock) : Icon(Icons.lock_open),
                        onPressed: () {
                          setState(() {
                            istap = !istap;
                          });
                        },
                      ),
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[100],
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.black38, width: 3))),
                )),
            Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {}, child: Text('Forgot password?'))),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences per = await SharedPreferences.getInstance();
                  per.setString(Prefs.email, _usernamecon.text);
                  // per.setString('password', _passwordcon.toString());
                  print(_usernamecon.text);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Homepage()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 57, 134, 196),
                    onPrimary: Colors.white,
                    // onSurface: Colors.red,
                    // alignment: Alignment(2, 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text('Log In')),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Don\'have an account?',
                      style: TextStyle(color: Colors.black38)),
                  TextSpan(
                      text: 'Sign Up', style: TextStyle(color: Colors.blue))
                ])),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 125),
                alignment: Alignment.bottomCenter,
                height: 100,
                child:
                    Image(image: AssetImage('assets/images/logobottom.png'))),
          ],
        ),
      ),
    );
  }
}
