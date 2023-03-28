
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myschool/routes.dart';
import 'package:myschool/screens/intro_screen/intro_screen.dart';
import 'package:myschool/screens/login_screen/login_screen.dart';
import 'package:myschool/screens/splash_screen/splash_screen.dart';
import 'package:myschool/theme.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
/*

 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, device){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My School',
        theme: CustomTheme().baseTheme,
        //initial route is splash screen
        //mean first screen
        initialRoute: LoginScreen.routeName,
        routes: routes,
      );
    });
  }
}
