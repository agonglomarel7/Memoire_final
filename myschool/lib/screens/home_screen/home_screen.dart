
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "Smith",
        style: TextStyle(
          color: Color.fromARGB(255, 194, 194, 206),
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

}
