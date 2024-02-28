// ignore_for_file: file_names

import 'dart:math';
import 'package:app23/screens/DoctorPage.dart';
import 'package:flutter/material.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Night';
}

PageController controller = PageController();
List<Widget> listContainers = [
  Container(
    color: Colors.purple,
  ),
  Container(
    color: Colors.pinkAccent,
  ),
  Container(
    color: Colors.blueAccent,
  ),
  Container(
    color: Colors.yellow,
  ),
  Container(
    color: Colors.blue,
  )
];

List image2 = [
  'assets/images/water2.webp',
  'assets/images/walking.jpg',
  'assets/images/sleep.jpg',
  'assets/images/sun.jpg',
  'assets/images/apple.jpg',
  'assets/images/meditate.jpg'
];

List images = [
  'assets/images/badsleep.jpeg',
  'assets/images/stress.jpg',
  'assets/images/stuck.webp',
  'assets/images/headache.jpg',
  'assets/images/focus.jpg',
];

bool _value1 = false;
bool _value2 = false;
bool _value3 = false;
bool _value4 = false;
bool _value5 = false;
bool _value6 = false;

List values = [_value1, _value2, _value3, _value4, _value5, _value6];

List numbers = List<int>.generate(
    categories.length, (i) => rand.nextInt(categories.length) + 4);

List categories = [
  "Can't Sleep?",
  "Feeling Stressed?",
  "feeling Stuck?",
  "physical illness?",
  "Can't focus?"
];

List healthyAdvice = [
  "Drink 8 glasses of water everyday",
  "Workout an hour everyday",
  "Sleep 7+ hours everyday",
  "Use Sunscreen everyday",
  "Eat an apple everyday",
  "Meditate everyday"
];
Random rand = Random();

// ignore: must_be_immutable
class HomePartPage extends StatefulWidget {
  static String routeName = '/homehome';

  const HomePartPage({super.key});

  @override
  State<HomePartPage> createState() => _HomePartPageState();
}

class _HomePartPageState extends State<HomePartPage> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> _chartKey2 =
      GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> _chartKey3 =
      GlobalKey<AnimatedCircularChartState>();
  double adad = random.nextInt(31) + 70;
  double adad2 = random.nextInt(31) + 70;
  double adad3 = random.nextInt(31) + 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Good ${greeting()} and Stay Healthy',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'google2',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Bluetooth Connected',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.bluetooth_connected,
                  color: Colors.blue,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    AnimatedCircularChart(
                      holeRadius: 40,
                      key: _chartKey,
                      size: const Size(120.0, 120.0),
                      duration: const Duration(seconds: 3),
                      initialChartData: <CircularStackEntry>[
                        CircularStackEntry(
                          <CircularSegmentEntry>[
                            CircularSegmentEntry(
                              adad,
                              adad > 80 ? Colors.green : Colors.redAccent,
                            ),
                            CircularSegmentEntry(
                              100 - adad,
                              adad > 80 ? Colors.green[100] : Colors.red[100],
                            ),
                          ],
                        ),
                      ],
                      chartType: CircularChartType.Radial,
                      percentageValues: true,
                      holeLabel: adad > 80
                          ? ''' ${adad.toString()}%
 Good!'''
                          : '''     ${adad.toString()}%
 Not Good!''',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      'Blood Pressure',
                      style: TextStyle(
                        color: adad > 80 ? Colors.green : Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    AnimatedCircularChart(
                      holeRadius: 40,
                      key: _chartKey3,
                      size: const Size(120.0, 120.0),
                      duration: const Duration(seconds: 6),
                      initialChartData: <CircularStackEntry>[
                        CircularStackEntry(
                          <CircularSegmentEntry>[
                            CircularSegmentEntry(
                              adad2,
                              adad2 > 80 ? Colors.green : Colors.red,
                            ),
                            CircularSegmentEntry(
                              100 - adad2,
                              adad2 > 80 ? Colors.green[100] : Colors.red[100],
                            ),
                          ],
                        ),
                      ],
                      chartType: CircularChartType.Radial,
                      percentageValues: true,
                      holeLabel: adad2 > 80
                          ? ''' ${adad2.toString()}%
 Good!'''
                          : '''    ${adad2.toString()}%
 Not Good!''',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      '''      Fasting
Blood Glucose''',
                      style: TextStyle(
                        color: adad2 > 80 ? Colors.green : Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    AnimatedCircularChart(
                      holeRadius: 40,
                      key: _chartKey2,
                      size: const Size(120.0, 120.0),
                      duration: const Duration(seconds: 9),
                      initialChartData: <CircularStackEntry>[
                        CircularStackEntry(
                          <CircularSegmentEntry>[
                            CircularSegmentEntry(
                              adad3,
                              adad3 > 80 ? Colors.green : Colors.red,
                            ),
                            CircularSegmentEntry(
                              100 - adad3,
                              adad3 > 80 ? Colors.green[100] : Colors.red[100],
                            ),
                          ],
                        ),
                      ],
                      chartType: CircularChartType.Radial,
                      percentageValues: true,
                      holeLabel: adad3 > 80
                          ? ''' ${adad3.toString()}%
 Good!'''
                          : '''     ${adad3.toString()}%
 Not Good!''',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      'Blood Oxygen',
                      style: TextStyle(
                        color: adad3 > 80 ? Colors.green : Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 12,
                ),
                Text(
                  "For you now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SizedBox(
                height: 262,
                width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        color: Colors.red[50],
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              color: Colors.grey[200],
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              categories[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              '${numbers[index].toString()} exerices',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent),
                              onPressed: () {},
                              child: const Text(
                                'Start Journey!',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 12,
                ),
                Text(
                  'To be Healtier',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SizedBox(
                height: 260,
                width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        color: Colors.red[50],
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              color: Colors.grey[200],
                              child: Image.asset(
                                image2[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 130,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      healthyAdvice[index],
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.redAccent,
                              ),
                              width: 97,
                              height: 30,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  const Text(
                                    "Done",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Checkbox(
                                    value: values[index],
                                    side: const BorderSide(
                                        color: Colors.white, width: 1.5),
                                    activeColor: Colors.redAccent,
                                    onChanged: (value) {
                                      setState(() {
                                        values[index] = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
