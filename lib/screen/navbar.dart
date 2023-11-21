import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ytsapp/screen/categoryscreen.dart';
import 'package:ytsapp/screen/homepage.dart';
import 'package:ytsapp/screen/profilescreen.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      // appBar: AppBar(
      //   title: Text('Curved Navigation Bar Example'),
      // ),
      body: _pages[_selectedIndex], // Display the selected screen
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: CurvedNavigationBar(
          backgroundColor: Colors.grey.shade900,
          color: Colors.grey.shade800 ?? Colors.white,
          index: _selectedIndex,
          height: 50,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.red.shade900,
            ),
            Icon(
              Icons.category_sharp,
              size: 30,
              color: Colors.red.shade900,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Colors.red.shade900,
            ),
          ],
          onTap: (int index) {
            setState(() {
              _selectedIndex = index; // Update the selected index
            });
          },
        ),
      ),
    );
  }
}
