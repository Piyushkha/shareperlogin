// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login.dart';
import 'package:instagram_clone/screens/share_preffrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _MainpageState();
}

class _MainpageState extends State<Homepage> {
  String _text = '';

  value() async {
    SharedPreferences per = await SharedPreferences.getInstance();

    setState(() {
      _text = per.getString(Prefs.email)!;
    });

    print(_text);
  }

  @override
  void initState() {
    super.initState();
    value();
  }

  logout() async {
    SharedPreferences per = await SharedPreferences.getInstance();
    per.clear();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    value();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.black,
              size: 35,
            ),
            title: IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: (() => logout()),
            )),
        //   title: Container(
        //     alignment: Alignment.topLeft,
        //     height: 32,
        //     decoration: const BoxDecoration(
        //         image: const DecorationImage(
        //             image: AssetImage('assets/images/name.png'),
        //             alignment: Alignment.topLeft)),
        //   ),
        //   // flexibleSpace:
        //   actions: const [
        //     Padding(
        //       padding: EdgeInsets.only(right: 25.0),
        //       child: Icon(
        //         Icons.message_outlined,
        //         color: Colors.black,
        //       ),
        //     )
        //   ],
        // ),
        body:
            // ListView(
            //   scrollDirection: Axis.vertical,
            //   children: [
            //     Row(
            //       children: [
            //         const CircleAvatar(),
            //         const CircleAvatar(),
            //         const CircleAvatar(),
            //         const CircleAvatar(),
            //         const CircleAvatar(),
            //         const CircleAvatar()
            //       ],
            //     ),
            //     // ListView(
            //     //   scrollDirection: Axis.horizontal,
            //     //   children: [CircleAvatar()],
            //     // ),
            // Container(
            //     // color: Colors.blue.shade300,
            //     height: 50,
            //     child:
            Center(
          child: Text(
            'hello==  $_text',
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
        ));
    //       )
    //     ],
    //   ),
    // );
  }
}
