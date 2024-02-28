// ignore_for_file: file_names

import 'package:app23/screens/RoutePage.dart';
import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  static String routeName = '/appointment';
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          height: 50,
          width: 360,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoutePage(),
                  ));
            },
            child: const Text(
              'Done',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadiusDirectional.circular(100)),
                ),
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadiusDirectional.circular(100)),
                  child: const Icon(
                    Icons.done_rounded,
                    size: 80,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Thank You!',
              style: TextStyle(fontSize: 25, color: Colors.green),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Your appointment created',
              style: TextStyle(fontSize: 17, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
