// ignore_for_file: file_names

import 'package:app23/screens/DoctorPage.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static String routeName = '/search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<String> textCategory = [
  'Tooth 🦷',
  'Baby 👶🏼',
  'Bones 🦴',
  'Brain 🧠',
  'Eye 👁️',
  'Women 👩',
  'Heart ❤️',
  'Ear 👂',
];

String dropdownValue = textCategory.first;
int index_ = 0;

List storyNames = [
  'assets/images/dr1.jpg',
  'assets/images/dr2.jpg',
  'assets/images/dr3.webp',
  'assets/images/dr4.jpg',
  'assets/images/dr5.jpg',
  'assets/images/dentist3.jpeg',
  'assets/images/dentist1.jpg',
  'assets/images/dentist2.png',
  'assets/images/dentist8.jfif',
  'assets/images/dentist4.jpg',
  'assets/images/dentist5.jpg',
  'assets/images/dentist6.jpg',
  'assets/images/dentist7.jpg',
];

class _SearchPageState extends State<SearchPage> {
  int selectedIndex = 0;

  List<String> images = [
    'assets/images/tooth.jpg',
    'assets/images/baby2.png',
    'assets/images/bone2.jpg',
    'assets/images/brain.jpg',
    'assets/images/eye.png',
    'assets/images/woman.jpg',
    'assets/images/hearth.jpg',
    'assets/images/stomach.jpg',
  ];
  List<double> stars = [4.6, 4.9, 4.2, 4.7, 4.3, 3.8, 4.8, 4.9];

  List storyName = [
    '''Setareh Derakhshan''',
    'Setayesh Vali',
    'Sepehr Kamran',
    'Maryam Fatemi',
    'Bahram Shoorbakht',
    'Reza Sadeghi',
    'Somaye Rahmati',
    'Mahsa Amini',
    'Mahshid Heidari',
    'Fatemeh Amani',
    'Reza Mirdamadi',
    'Bizhan Rezaei',
    'Mohammad Mahdi Daee Karim Zadeh',
  ];
  List<String> names = [
    'Dr. Reza Sadeghi',
    'Dr. Somaye Rahmati',
    'Dr. Mahsa Amini',
    'Dr. Mahshid Heidari',
    'Dr. Fatemeh Amani',
    'Dr. Reza Mirdamadi',
    'Dr. Bizhan Rezaei',
    'Dr. Mohammad Mahdi Daee Karim Zadeh',
  ];

  List<String> drImages3 = [
    'assets/images/dentist3.jpeg',
    'assets/images/dentist1.jpg',
    'assets/images/dentist2.png',
    'assets/images/dentist8.jfif',
    'assets/images/dentist4.jpg',
    'assets/images/dentist5.jpg',
    'assets/images/dentist6.jpg',
    'assets/images/dentist7.jpg',
  ];

  Widget drGenerator(String image, double star, String name, String mode,
      void Function()? func) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 5,
        ),
        ClipRRect(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 90,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  star.toString(),
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                )
              ],
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  mode,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38
                    // fontFamily: 'google',
                    ,
                  ),
                ),
                const SizedBox(
                  width: 75,
                ),
                SizedBox(
                  height: 35,
                  width: 115,
                  child: ElevatedButton(
                    onPressed: func,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Check out',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50),
                                  color: Colors.redAccent,
                                ),
                              ),
                              Container(
                                width: 82,
                                height: 82,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50),
                                  color: Colors.white,
                                ),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(storyNames[index]),
                                  radius: 100,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            height: 30,
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    storyName[index],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              width: 370,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: TextFormField(
                      cursorColor: Colors.black87,
                      cursorHeight: 23,
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        focusColor: Colors.black87,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black87, width: 1.5),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black87, width: 1.5),
                        ),
                        hintText: 'Search Doctors',
                        hintStyle: const TextStyle(color: Colors.black87),
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 15.4,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        elevation: 0,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        underline: Container(
                          height: 1.5,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items: textCategory
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 287,
                width: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: stars.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 110,
                          color: Colors.white,
                          child: drGenerator(
                            drImages3[index],
                            stars[index],
                            names[index],
                            'Dentist',
                            () {
                              setState(() {
                                index_ = index;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorPage(index_),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
