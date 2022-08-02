import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Center(
          child: Text("Profile Name"),
        ),
        Row(
          children: [
            CircleAvatar(),
            Column(
              children: [Text("1500"), Text("Posts")],
            ),
            Column(children: [Text("898"), Text("Followers")]),
            Column(children: [Text("1310"), Text("Following")])
          ],
        )
      ]),
    );
  }
}
