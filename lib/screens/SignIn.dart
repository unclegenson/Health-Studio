// ignore_for_file: file_names

import 'package:app23/screens/CreateAccount.dart';
import 'package:app23/screens/RoutePage.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static String routeName = '/Signin';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();
bool valuee1 = false;
bool valuee2 = false;
SnackBar snackBar = const SnackBar(
  behavior: SnackBarBehavior.floating,
  duration: Duration(seconds: 2),
  content: Text('Please enter Valid Email and Password'),
);

class _SignInPageState extends State<SignInPage> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  bool value_ = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      }
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                  padding: const EdgeInsets.only(top: 0, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Sign In',
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
                        'Enter your info to Sign In',
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
              padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
              child: TextFormField(
                controller: controller2,
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
                    valuee2 = false;
                    return 'Please enter your Email';
                  }
                  if (!RegExp(
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(value)) {
                    valuee2 = false;
                    return 'Please enter a Valid Email';
                  } else {
                    valuee2 = true;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 25, right: 25),
              child: TextFormField(
                controller: controller1,
                cursorColor: Colors.black38,
                cursorWidth: 1.5,
                obscureText: _obscured,
                focusNode: textFieldFocusNode,
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
                      onTap: _toggleObscured,
                      child: Icon(
                        _obscured
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
                    setState(() {
                      valuee1 = false;
                    });
                    return 'Password is Required';
                  }
                  if (!RegExp(
                          r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
                      .hasMatch(value)) {
                    valuee1 = false;

                    return '''
More than 8 Characters
atleast :
  One Uppercase
  One LowerCase
  One Number''';
                  } else {
                    valuee1 = true;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: size.width * 2 / 3 + 32,
              child: ElevatedButton(
                onPressed: () {
                  if ((valuee1 == true) & (valuee2 == true)) {
                    Navigator.pushReplacementNamed(
                        context, RoutePage.routeName);
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
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(
                  width: 0.5,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
              child: SizedBox(
                width: size.width * 2 / 3,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Restart Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.black45,
                  endIndent: 20,
                  indent: 25,
                  thickness: 1,
                )),
                Text("OR"),
                Expanded(
                    child: Divider(
                  indent: 20,
                  color: Colors.black45,
                  endIndent: 25,
                  thickness: 1,
                )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: Colors.redAccent,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/google_icon.png',
                            height: 35,
                          ),
                          const Text(
                            'Google',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 1, color: Colors.indigo),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.facebook_rounded,
                            size: 23,
                            color: Colors.indigo,
                          ),
                          Text(
                            'Face Book',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, CreateAccount.routeName);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Create Account',
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
