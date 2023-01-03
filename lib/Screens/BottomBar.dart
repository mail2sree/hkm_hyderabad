// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:hkm_hyderabad/Screens/Home.dart';
import 'package:hkm_hyderabad/Screens/Library.dart';
import 'package:hkm_hyderabad/Screens/Login/Login.dart';
import 'package:hkm_hyderabad/Screens/Profile.dart';
import 'package:hkm_hyderabad/Screens/Shop.dart';

class NaviBottomNavBar extends StatefulWidget {
  @override
  _NaviBottomNavBarState createState() => _NaviBottomNavBarState();
}

class _NaviBottomNavBarState extends State<NaviBottomNavBar> {
  int currentIndex = 0;

  Key _widgetKey = UniqueKey();

  void _restartWidget() {
    setState(() {
      _widgetKey = UniqueKey();
    });
  }

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return  Home(key: _widgetKey,);
      case 1:
        return const Library();
      case 2:
        return const Shop();
      case 3:
        return const Profile();
      default:
        return Profile();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return Scaffold(
      body: callPage(currentIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            textTheme: TextTheme(
                headline1: TextStyle(color: Colors.black38.withOpacity(0.5)))),
        child: BottomNavyBar(
          selectedIndex: currentIndex,
          onItemSelected: (index) {
            setState(() => currentIndex = index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Home'),
                icon: Icon(Icons.home),
                activeColor: Colors.purple,
                inactiveColor: Colors.black38),
            BottomNavyBarItem(
                title: Text('Library'),
                icon: Icon(Icons.shop),
                activeColor: Colors.purple,
                inactiveColor: Colors.black38),
            BottomNavyBarItem(
                title: Text('Shop'),
                icon: Icon(Icons.shopping_cart),
                activeColor: Colors.purple,
                inactiveColor: Colors.black38),
            BottomNavyBarItem(
                title: Text('Profile'),
                icon: Icon(Icons.person),
                activeColor: Colors.purple,
                inactiveColor: Colors.black38),
          ],
        ),
      ),
    );
    } else {
      return LoginSplash();
    }
  }
}
