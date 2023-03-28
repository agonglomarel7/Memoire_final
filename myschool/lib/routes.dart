import 'package:flutter/cupertino.dart';
import 'package:myschool/screens/datesheet_screen/datesheet_screen.dart';
import 'package:myschool/screens/evenements/evenements.dart';
import 'package:myschool/screens/fee_screen/fee_screen.dart';
import 'package:myschool/screens/home_screen/home_screen.dart';
import 'package:myschool/screens/intro_screen/intro_screen.dart';
import 'package:myschool/screens/login_screen/login_screen.dart';
import 'package:myschool/screens/my_profile/my_profile.dart';
import 'package:myschool/screens/signUp_screen/signUp_screen.dart';
import 'package:myschool/screens/splash_screen/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android
  SplashScreen.routeName: (context) => SplashScreen(),
  IntroScreen.routeName: (context) => IntroScreen(),
  //LoginPage.routeName: (context)=>LoginPage(),
  HomeScreen.routeName: (context)=>HomeScreen(),
  SignUpScreen.RouteName: (context)=>SignUpScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MyProfileScreen.routeName: (context) => MyProfileScreen(),
  FeeScreen.routeName: (context) => FeeScreen(),
 EvenementScreen.routeName: (context) => EvenementScreen(),
  DateSheetScreen.routeName: (context) => DateSheetScreen(),
};
