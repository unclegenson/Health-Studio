// ignore_for_file: file_names

import 'package:app23/screens/SearchPage.dart';
import 'package:app23/screens/changeEmail.dart';
import 'package:flutter/material.dart';

import 'ChangeNumber.dart';
import 'Home.dart';
import '../screens/ProfilePage.dart';
import '../screens/SchedulePage.dart';

void main() => runApp(const RoutePage());

class RoutePage extends StatelessWidget {
  static String routeName = '/Routepage';
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePartPage(),
    const SearchPage(),
    const SchedulePage(),
    ProfilePage(dropdownValue, number, email),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 28,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              size: 28,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_rounded,
              size: 22,
            ),
            label: 'Schedule',
            activeIcon: Icon(
              Icons.calendar_today_sharp,
              size: 22,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 28,
            ),
            label: 'Profile',
            activeIcon: Icon(
              Icons.person,
              size: 28,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
