// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, file_names

import 'dart:async';
import 'package:app23/screens/RoutePage.dart';
import 'package:flutter/material.dart';

class DonePage extends StatefulWidget {
  static String routeName = '/Done';
  const DonePage({Key? key}) : super(key: key);
  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  bool _isLoading = true;
  bool nextpage = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        Navigator.pushNamed(context, RoutePage.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading) ...[
              Column(
                children: const [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(
                      strokeWidth: 7,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Signing in',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ] else ...[
              Column(
                children: const [
                  Icon(
                    Icons.done_rounded,
                    size: 74,
                    color: Colors.green,
                  ),
                  Text(
                    'Signed in successfully',
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Welcome :)',
                    style: TextStyle(fontSize: 15, color: Colors.green),
                  )
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
