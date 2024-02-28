// ignore_for_file: file_names

import 'dart:io';

import 'package:app23/screens/changeEmail.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'ChangeLanguage.dart';
import 'ChangeNumber.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = '/profile';
  static String dropdownValue = '';
  const ProfilePage(dropdownValue, number, email, {super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String img = 'assets/images/img2.jpg';
  bool changed = false;
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;
    setState(() {
      img = file.path!;
      changed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Welcome Home Mohammad Mahdi',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontFamily: 'google2',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Drawer(
        width: MediaQuery.of(context).size.width,
        shadowColor: Colors.redAccent,
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    changed == true
                        ? CircleAvatar(
                            radius: 100,
                            backgroundImage: FileImage(File(img)),
                          )
                        : CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage(img),
                          ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.redAccent,
                      ),
                      child: IconButton(
                        onPressed: () {
                          _pickFile();
                        },
                        icon: Row(
                          children: const [
                            Icon(
                              Icons.add_a_photo,
                              size: 21,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Account',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            inkWellGenerator(
              Icons.phone,
              number,
              'Long Press to change phone number',
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeNumber()));
              },
            ),
            inkWellGenerator(
              Icons.email_outlined,
              'Email: $email',
              'Long Press to change your Email',
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeEmail()));
              },
            ),
            inkWellGenerator(
              Icons.language,
              'Language: ${dropdownValue.toString()}',
              'Long Press to change language',
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeLanguage()));
              },
            ),
            inkWellGenerator(
              Icons.bookmark_border,
              'My Doctors',
              'Long Press to view details',
              () {},
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              endIndent: 15,
              indent: 15,
              thickness: 2,
              color: Colors.redAccent,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Help',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            inkWellGenerator2(
                Icons.question_answer_outlined, 'Ask a Question?', _launchUrl3),
            inkWellGenerator2(Icons.public, 'myhealth.com', _launchUrl1),
            inkWellGenerator2(
                Icons.security_sharp, 'Privacy policy', _launchUrl2),
          ],
        ),
      ),
    );
  }
}

Widget inkWellGenerator(
    IconData icon, String text, String text2, void Function() tap) {
  return InkWell(
    onLongPress: tap,
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  text2,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget inkWellGenerator2(IconData icon, String text, void Function() tapp) {
  return InkWell(
    onTap: tapp,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

final Uri _url1 = Uri.parse('https://www.digitalhealth.gov.au/');
final Uri _url2 =
    Uri.parse('https://www.digitalhealth.gov.au/myhealth/privacy');
final Uri _url3 =
    Uri.parse('https://www.digitalhealth.gov.au/support/contact-us');

Future<void> _launchUrl1() async {
  if (!await launchUrl(_url1)) {
    throw Exception('Could not launch $_url1');
  }
}

Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw Exception('Could not launch $_url2');
  }
}

Future<void> _launchUrl3() async {
  if (!await launchUrl(_url3)) {
    throw Exception('Could not launch $_url3');
  }
}
