// ignore_for_file: file_names

import 'dart:async';

import 'package:app23/screens/ChangeNumber.dart';
import 'package:app23/screens/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'RoutePage.dart';
import 'changeEmail.dart';
import 'info.dart';

class ChangeLanguage extends StatefulWidget {
  static String routeName = '/changeLanguage';

  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class SpeedModel {
  const SpeedModel(this.name, this.icon);
  final String name;
  final Icon icon;
}

bool focus = false;

SnackBar snackBar = SnackBar(
  behavior: SnackBarBehavior.floating,
  duration: const Duration(seconds: 2),
  content: const Text('Language Changed!'),
  action: SnackBarAction(
    onPressed: () {},
    label: 'Undo',
    textColor: Colors.redAccent,
  ),
);
SnackBar snackBar2 = SnackBar(
  behavior: SnackBarBehavior.floating,
  duration: const Duration(seconds: 2),
  content: const Text("It didn't change!"),
  action: SnackBarAction(
    onPressed: () {},
    label: 'Undo',
    textColor: Colors.redAccent,
  ),
);

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.redAccent,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfilePage(dropdownValue, number, email)));
          },
        ),
      ),
      body: Body(
        snackBar: snackBar,
        snackBar2: snackBar2,
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
    required this.snackBar,
    required this.snackBar2,
  });

  final SnackBar snackBar;
  final SnackBar snackBar2;

  @override
  State<Body> createState() => _BodyState();
}

const List<String> list_ = <String>['English', 'Persian', 'Arabic', 'German'];
String firstValue = list_.first;
String dropdownValue = list_.first;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Icon(
            Icons.language,
            color: Colors.redAccent,
            size: 120,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Change Language',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 12),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.redAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  info().dropdownValue = dropdownValue;
                });
              },
              items: list_.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(42.0),
            child: Text(
              "You can change your MyHealth app Language here everytime you want!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.redAccent,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 300,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (dropdownValue != firstValue) {
                  ScaffoldMessenger.of(context).showSnackBar(widget.snackBar);
                  Timer(
                    const Duration(seconds: 3),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoutePage(
                            pageIndex: 3,
                            dropdownValue: info().dropdownValue,
                            email: info().email,
                            number: info().number,
                          ),
                        ),
                      );
                    },
                  );
                  setState(() {
                    info().dropdownValue = dropdownValue;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(widget.snackBar2);
                }
              },
              child: const Text(
                'Change Language',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
