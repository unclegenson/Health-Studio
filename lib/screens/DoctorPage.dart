// ignore_for_file: file_names

import 'package:app23/screens/SearchPage.dart';
import 'package:app23/screens/appintmentCreate.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

Random random = Random();
DateTime datetime = DateTime.now();
Map weekDay = {
  1: 'Sat',
  2: 'Sun',
  3: 'Mon',
  4: 'Tue',
  5: 'Wed',
  6: 'Thur',
  7: 'Fri'
};
List times = [
  '9:00 AM',
  '9:30 AM',
  '10:00 AM',
  '10:30 AM',
  '11:00 AM',
  '15:00 PM',
  '15:30 PM',
  '16:00 PM',
  '16:30 PM'
];
List<String> names2 = [
  'Dr. Reza Sadeghi',
  'Dr. Somaye Rahmati',
  'Dr. Mahsa Amini',
  'Dr. Mahshid Heidari',
  'Dr. Fatemeh Amani',
  'Dr. Reza Mirdamadi',
  'Dr. Bizhan Rezaei',
  'Dr. Mohammad Mahdi Daee Karim Zadeh',
];

List<String> drImages2 = [
  'assets/images/dentist3.jpeg',
  'assets/images/dentist1.jpg',
  'assets/images/dentist2.png',
  'assets/images/dentist8.jfif',
  'assets/images/dentist4.jpg',
  'assets/images/dentist5.jpg',
  'assets/images/dentist6.jpg',
  'assets/images/dentist7.jpg',
];
Color containerColor = Colors.white;

class DoctorPage extends StatefulWidget {
  static String routeName = '/doctorpage';
  const DoctorPage(index_, {super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

_launchURL() async {
  final Uri url = Uri.parse(
      'https://www.google.com/maps/dir/32.6634737,51.6939782/Isfahan+%D8%B3%D9%87%E2%80%8C%D8%B1%D8%A7%D9%87+%D8%B3%DB%8C%D9%85%DB%8C%D9%86%D8%8C+%D8%AE%DB%8C%D8%A7%D8%A8%D8%A7%D9%86+%D8%AC%D8%A7%D9%86%D8%A8%D8%A7%D8%B2%D8%A7%D9%86%D8%8C+%D8%A7%D9%86%D8%AA%D9%87%D8%A7%DB%8C,+%D8%A8%D9%84%D9%88%D8%A7%D8%B1+%D8%B4%D9%87%DB%8C%D8%AF+%D8%A8%D8%AE%D8%B4%DB%8C,+No.+%D8%A8%D9%84%D9%88%D8%A7%D8%B1+%DA%A9%D8%B4%D8%A7%D9%88%D8%B1%D8%B2,+Milad+Hospital%E2%80%AD%E2%80%AD/@32.6301226,51.6652926,12.73z/data=!4m9!4m8!1m1!4e1!1m5!1m1!1s0x3fbc36be46e5fed1:0xe60097d603b6d9eb!2m2!1d51.6186162!2d32.6107707?entry=ttu');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

List images = [
  'assets/images/man.png',
  'assets/images/man2.jfif',
  'assets/images/girl.jpg',
  'assets/images/man3.jfif',
  'assets/images/girl3.jpg'
];
List names = [
  'Ali Mir Mohammad Sadeghi',
  'Reza Etesami',
  'Fatemeh Karim Zadeh',
  'Navid Keivai',
  'Samira Kazemi'
];

bool saved = false;
int a = random.nextInt(10);
int b = random.nextInt(10);
int c = random.nextInt(10);
int d = random.nextInt(10);
List indexes = [a, b, c, d];
List hours = [
  (random.nextInt(24) + 1).toString(),
  (random.nextInt(24) + 1).toString(),
  (random.nextInt(24) + 1).toString(),
  (random.nextInt(24) + 1).toString(),
  (random.nextInt(24) + 1).toString(),
];
List stars = [5.0, 4.5, 5.0, 4.0, 4.5];
int selectedIndex = 0;
int selectedIndex2 = 0;

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text(names2[index_]),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 90.0),
                  ),
                ),
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 135,
                        width: 135,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadiusDirectional.circular(100),
                        ),
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(drImages2[index_]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Dentist',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadiusDirectional.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadiusDirectional.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 410,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'About Doctor',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        '''Dr Mahshid Heidari is an experienced speciallist who is 
consistantly working on improving her skills.''',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                      const Text(
                        'Reviews',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                      const Text(
                        ' 4.6 ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        ' (43) ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            color: Colors.indigoAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 28,
                    height: 145,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: 240,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              color: const Color.fromARGB(255, 243, 222, 229),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(images[index]),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 70,
                                      width: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  names[index],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${hours[index]} hours ago',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  const Icon(
                                                    Icons.star,
                                                    size: 17,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(
                                                    stars[index].toString(),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Flexible(
                                      child: Text(
                                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 18, right: 14),
                    child: Container(
                      height: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: const Color.fromARGB(255, 243, 222, 229),
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 268, top: 10),
                                child: Text(
                                  'Location',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                100),
                                        color: Colors.pink[100]),
                                    child: const Icon(
                                      Icons.location_on,
                                      color: Colors.redAccent,
                                      size: 50,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              'Milad Hospital',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          'Shahrak-e Valieasr (Keshavarz Blvd), Isfahan',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: _launchURL,
                              child: const Text('Go to Google map'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        'Select Date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    width: 370,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8, top: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                int a = random.nextInt(10);
                                int b = random.nextInt(10);
                                int c = random.nextInt(10);
                                int d = random.nextInt(10);
                                indexes = [a, b, c, d];
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(10),
                                color: selectedIndex == index
                                    ? Colors.redAccent
                                    : Colors.white,
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.redAccent,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    weekDay[datetime
                                        .add(Duration(days: index))
                                        .weekday
                                        .toInt()]!,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    datetime
                                        .add(Duration(days: index))
                                        .day
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        'Select Time',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 55,
                      ),
                      Text(
                        'Note: Some times were already chosen',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 170,
                    width: 360,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 8 / 3,
                      ),
                      itemCount: 9,
                      itemBuilder: (BuildContext ctx, index) =>
                          indexes.contains(index)
                              ? AbsorbPointer(
                                  child: InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          selectedIndex2 = index;
                                        },
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.redAccent,
                                        ),
                                        color: selectedIndex2 == index
                                            ? Colors.redAccent
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        times[index],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex2 = index;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.redAccent,
                                      ),
                                      color: selectedIndex2 == index
                                          ? Colors.redAccent
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      times[index],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 14, right: 8, bottom: 8),
        child: Row(
          children: [
            SizedBox(
              height: 55,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Book Appointment',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Appointment(),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: SizedBox(
                height: 55,
                width: 55,
                child: Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 3,
                        color: Colors.redAccent,
                      ),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        saved
                            ? Icons.bookmark_add
                            : Icons.bookmark_add_outlined,
                        color: Colors.redAccent,
                        size: 30,
                      ),
                      onPressed: () {
                        if (saved == true) {
                          setState(() {
                            saved = false;
                          });
                        } else {
                          setState(() {
                            saved = true;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
