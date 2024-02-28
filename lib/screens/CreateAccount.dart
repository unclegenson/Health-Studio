// ignore_for_file: file_names

import 'package:app23/screens/Done.dart';
import 'package:app23/screens/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});
  static String routeName = '/createaccount';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirm = TextEditingController();
  TextEditingController controllerID = TextEditingController();
  TextEditingController controllerID2 = TextEditingController();
  IconData doctorIcon = Icons.close;
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNode2 = FocusNode();
  bool _obscured1 = true;
  bool _obscured2 = true;
  void _toggleObscured1() {
    setState(() {
      _obscured1 = !_obscured1;
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
    });
  }

  SnackBar snackBar = const SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
    content: Text('Please enter Valid informations'),
  );
  CountryCode codeNumber = CountryCode(dialCode: AutofillHints.countryCode);
  bool value2 = false;
  bool value1 = false;
  bool iconVal1 = false;
  bool iconVal2 = false;

  bool valuee1 = false;
  bool valuee2 = false;
  bool valuee3 = false;
  bool valuee4 = false;
  bool valuee5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.account_circle,
                  size: 130,
                  color: Colors.redAccent,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Enter your info to create an account',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextFormField(
                controller: controllerEmail,
                cursorColor: Colors.black38,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                cursorHeight: 23,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black54, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                  labelStyle: const TextStyle(color: Colors.black54),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black54,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    valuee1 = false;
                    return 'Please enter your Email';
                  }
                  if (!RegExp(
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(value)) {
                    valuee1 = false;
                    return 'Please enter a Valid Email';
                  } else {
                    valuee1 = true;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextFormField(
                controller: controllerPassword,
                cursorColor: Colors.black38,
                cursorWidth: 1.5,
                obscureText: _obscured1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorHeight: 24,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black54, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.black54),
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                    size: 24,
                    color: Colors.black54,
                  ),
                  hintText: 'eXamPLe1234',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: GestureDetector(
                      onTap: _toggleObscured1,
                      child: Icon(
                        _obscured1
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: 24,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    valuee2 = false;
                    return 'Password is Required';
                  }
                  if (!RegExp(
                          r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
                      .hasMatch(value)) {
                    valuee2 = false;
                    return '''
More than 8 Characters
atleast :
  One Uppercase
  One LowerCase
  One Number''';
                  } else {
                    valuee2 = true;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: TextFormField(
                controller: controllerConfirm,
                cursorColor: Colors.black38,
                cursorWidth: 1.5,
                obscureText: _obscured2,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorHeight: 24,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black54, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(color: Colors.black54),
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                    size: 24,
                    color: Colors.black54,
                  ),
                  hintText: 'Confirm Password',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: GestureDetector(
                      onTap: _toggleObscured2,
                      child: Icon(
                        _obscured2
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: 24,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    valuee3 = false;
                    return 'Confirm the password';
                  }
                  if (value != controllerPassword.text) {
                    valuee3 = false;
                    return 'Not same as upward password';
                  } else {
                    valuee3 = true;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Are you a Doctor?",
                          style: TextStyle(fontSize: 17.0),
                        ),
                        Row(
                          children: [
                            const Text('Yes'),
                            Checkbox(
                              activeColor: Colors.green,
                              value: value1,
                              onChanged: (value) {
                                setState(() {
                                  value1 = value!;
                                  value2 = !value;
                                });
                              },
                            ),
                            const Text('No'),
                            Checkbox(
                              activeColor: Colors.redAccent,
                              value: value2,
                              onChanged: (value) {
                                setState(() {
                                  value2 = value!;
                                  value1 = !value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 175,
                    height: 70,
                    child: value1
                        ? TextFormField(
                            controller: controllerID,
                            onChanged: (value) {
                              if (value.length == 5) {
                                setState(() {
                                  doctorIcon = Icons.check;
                                  iconVal1 = true;
                                });
                              } else {
                                setState(() {
                                  doctorIcon = Icons.close;
                                  iconVal1 = false;
                                });
                              }
                            },
                            cursorColor: Colors.black38,
                            cursorWidth: 1.5,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorHeight: 24,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black54, width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Medical Council Code/Number',
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              prefixIcon: Icon(
                                doctorIcon,
                                size: 24,
                                color: iconVal1 ? Colors.green : Colors.red,
                              ),
                              hintText: 'xxxxx',
                            ),
                            validator: (value) {
                              if (value!.length != 5) {
                                valuee4 = false;
                                return 'It must be 5 digits';
                              } else {
                                valuee4 = true;
                              }
                              return null;
                            },
                          )
                        : TextFormField(
                            controller: controllerID2,
                            onChanged: (value) {
                              if (value.length == 10) {
                                setState(() {
                                  doctorIcon = Icons.check;
                                  iconVal2 = true;
                                });
                              } else {
                                setState(() {
                                  doctorIcon = Icons.close;
                                  iconVal2 = false;
                                });
                              }
                            },
                            cursorColor: Colors.black38,
                            cursorWidth: 1.5,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorHeight: 24,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black54, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'National Code/ID Number',
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              prefixIcon: Icon(
                                doctorIcon,
                                size: 24,
                                color: iconVal2 ? Colors.green : Colors.red,
                              ),
                              hintText: 'xxxxxxxxxx',
                            ),
                            validator: (value) {
                              if (value!.length != 10) {
                                valuee5 = false;
                                return 'It must be 10 digits';
                              } else {
                                valuee5 = true;
                              }
                              return null;
                            },
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (controllerEmail.text.isNotEmpty &
                      controllerEmail.text.isNotEmpty &
                      controllerPassword.text.isNotEmpty &
                      controllerPassword.text.isNotEmpty &
                      controllerConfirm.text.isNotEmpty &
                      controllerConfirm.text.isNotEmpty &
                      (controllerID.text.isNotEmpty &
                              controllerID.text.isNotEmpty ||
                          controllerID2.text.isNotEmpty &
                              controllerID2.text.isNotEmpty &
                              (valuee1 == true) &
                              (valuee2 == true) &
                              (valuee3 == true) &
                              ((valuee4 == true) || (valuee5 == true)))) {
                    Navigator.pushReplacementNamed(context, DonePage.routeName);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, SignInPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    width: 0.5,
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
