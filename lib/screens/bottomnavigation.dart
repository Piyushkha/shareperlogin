import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/mainpage.dart';
import 'package:instagram_clone/screens/notification.dart';
import 'package:instagram_clone/screens/profile.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  void _onitemTabped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          unselectedFontSize: 15,
          selectedFontSize: 15,
          selectedIconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.black,
          // fixedColor: Colors.black,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: selectedIndex == 0
                    ? Icon(Icons.home)
                    : Icon(Icons.home_outlined),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_off_outlined), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_outlined), label: 'Reals'),
            BottomNavigationBarItem(
                icon: Icon(Icons.hearing_outlined), label: 'Notifation'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_off_outlined), label: 'Profile'),
          ],
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          selectedItemColor: Colors.black,
          showUnselectedLabels: false,
          onTap: _onitemTabped),
      body: selectedIndex == 4
          ? ProfileScreen()
          : selectedIndex == 3
              ? Notificationscreen()
              : Homepage(),
    );
  }
}
