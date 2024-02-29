// ignore_for_file: file_names

import 'package:app23/screens/DoctorPage.dart';
import 'package:app23/screens/SearchPage.dart';
import 'package:app23/screens/changeEmail.dart';
import 'package:flutter/material.dart';
import 'info.dart';
import 'ChangeNumber.dart';
import 'Home.dart';
import '../screens/ProfilePage.dart';
import '../screens/SchedulePage.dart';

void main() => runApp(
      RoutePage(
        pageIndex: 0,
        dropdownValue: info().dropdownValue,
        email: info().email,
        number: info().number,
      ),
    );

class RoutePage extends StatefulWidget {
  final int pageIndex;
  final String dropdownValue;
  final String number;
  final String email;

  static String routeName = '/Routepage';
  const RoutePage(
      {super.key,
      required this.pageIndex,
      required this.dropdownValue,
      required this.number,
      required this.email});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  void initState() {
    _selectedIndex = widget.pageIndex;
    super.initState();
  }

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

int _selectedIndex = 0;

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
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
