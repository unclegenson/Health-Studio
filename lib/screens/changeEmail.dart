// ignore_for_file: file_names

import 'dart:async';

import 'package:app23/screens/ChangeLanguage.dart';
import 'package:app23/screens/ChangeNumber.dart';
import 'package:flutter/material.dart';

import 'ProfilePage.dart';
import 'RoutePage.dart';
import 'info.dart';

class ChangeEmail extends StatefulWidget {
  static String routeName = '/changeEmail';

  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

String email = 'unclegenson@gmail.com';

class _ChangeEmailState extends State<ChangeEmail> {
  bool focus = false;

  SnackBar snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    content: const Text('Email Address Changed!'),
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
                builder: (context) => ProfilePage(dropdownValue, number, email),
              ),
            );
          },
        ),
      ),
      body: Body(
        number: email,
        snackBar: snackBar,
        snackBar2: snackBar2,
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
    required this.number,
    required this.snackBar,
    required this.snackBar2,
  });

  final String number;
  final SnackBar snackBar;
  final SnackBar snackBar2;

  @override
  State<Body> createState() => _BodyState();
}

String nextvalue = 'unclegenson@gmail.com';

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 120),
          const Icon(
            Icons.email_outlined,
            color: Colors.redAccent,
            size: 100,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Change Email',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 12),
            child: TextFormField(
              onChanged: (value) {
                email = value;
              },
              cursorColor: Colors.black,
              cursorWidth: 1.5,
              initialValue: email,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorHeight: 24,
              decoration: const InputDecoration(
                prefixText: '  ',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent, width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is Required';
                }
                if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
                  return 'Not accepted';
                }

                return null;
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(42.0),
            child: Text(
              "You can change your MyHealth Email here. All messages and notifications will be sent to the new Email. You can change it once in a weak, So be carefull !",
              style: TextStyle(
                fontSize: 16,
                color: Colors.redAccent,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Timer(const Duration(milliseconds: 300), () {
                Navigator.pop(context);
              });
            },
            child: Text(
              'keep $email',
              style: const TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
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
                if (nextvalue != email) {
                  ScaffoldMessenger.of(context).showSnackBar(widget.snackBar);
                  Timer(
                    const Duration(seconds: 3),
                    () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return RoutePage(
                            pageIndex: 3,
                            dropdownValue: info().dropdownValue,
                            email: info().email,
                            number: info().number,
                          );
                        },
                      ));
                    },
                  );
                  setState(() {
                    nextvalue = email;
                    info().email = email;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(widget.snackBar2);
                }
              },
              child: const Text(
                'Change Email Address',
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
