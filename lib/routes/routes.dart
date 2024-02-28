import 'package:app23/screens/appintmentCreate.dart';
import 'package:app23/screens/changeEmail.dart';
import 'package:flutter/material.dart';
import '../screens/ChangeLanguage.dart';
import '../screens/firstRoute.dart';
import '../screens/SignIn.dart';
import '../screens/RoutePage.dart';
import '../screens/Home.dart';
import '../screens/SchedulePage.dart';
import '../screens/ProfilePage.dart';
import '../screens/Done.dart';
import '../screens/SearchPage.dart';
import '../screens/ChangeNumber.dart';
import '../screens/CreateAccount.dart';

final Map<String, WidgetBuilder> routes = {
  FirstRoutePage.routeName: (context) => const FirstRoutePage(),
  SignInPage.routeName: (context) => const SignInPage(),
  RoutePage.routeName: (context) => const RoutePage(),
  HomePartPage.routeName: (context) => const HomePartPage(),
  SchedulePage.routeName: (context) => const SchedulePage(),
  ProfilePage.routeName: (context) =>
      ProfilePage(ProfilePage.dropdownValue, number, email),
  DonePage.routeName: (context) => const DonePage(),
  SearchPage.routeName: (context) => const SearchPage(),
  ChangeNumber.routeName: (context) => const ChangeNumber(),
  ChangeEmail.routeName: (context) => const ChangeEmail(),
  CreateAccount.routeName: (context) => const CreateAccount(),
  ChangeLanguage.routeName: (context) => const ChangeLanguage(),
  Appointment.routeName: (context) => const Appointment(),
};
