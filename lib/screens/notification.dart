import 'package:flutter/material.dart';

class Notificationscreen extends StatefulWidget {
  Notificationscreen({Key? key}) : super(key: key);

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('notification')),
    );
  }
}
