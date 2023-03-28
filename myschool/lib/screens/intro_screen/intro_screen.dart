
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myschool/screens/login_screen/login_screen.dart';

class IntroScreen extends StatefulWidget {
  static String routeName = 'IntroScreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Elèves',
        body: "Mobile School collabore directememnt avec les parents des apprenants pour une meilleur suivi.",
        image: Center(
            child: Image.asset('assets/intro_images/student.png',height: 237.0,fit: BoxFit.cover,),
          ),
        decoration: const PageDecoration(
            bodyPadding:  EdgeInsets.symmetric(vertical: 25),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
            )
        )
    ),
    PageViewModel(
        title: 'Administration',
        body: "Avec Mobile School, c’est un système de gestion numérique des apprenants dans nos différents collèges.",
        image: Center(child: Image.asset('assets/intro_images/educator.png',),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            )
        )
    ),
    PageViewModel(
        title: 'Parents',
        body: "Avec Mobile School, l’administration gère éfficacement le suivi des activiés scolaire par les parents.",
        image: Center(child: Image.asset('assets/intro_images/family.png',width:600,height: 237.0,fit: BoxFit.cover,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            )
        )
    )
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/family.png'),fit: BoxFit.cover
                )
            ),
            padding: EdgeInsets.only(top: 50),
            child:
            Container(child:
            Stack(
              children: [
                IntroductionScreen(
                  pages: pages,
                  dotsDecorator: const DotsDecorator(
                      size: Size(10, 10),
                      color: Colors.white,
                      activeSize: Size.square(15.0),
                      activeColor: Colors.red
                  ),
                  showDoneButton: true,
                  done: const Text('Done', style: TextStyle(fontSize: 20,color: Color(0xFFFFFFFF)),),
                  showSkipButton: true,
                  skip: const Text('Skip',style: TextStyle(fontSize: 20,color: Colors.white ),),
                  showNextButton: true,
                  next: const Icon(Icons.arrow_forward,size: 20,color: Colors.white),
                  onDone: ()=> onDone(context),
                ),
              ],
            ),
            )
        )
    );

  }

  void onDone(context){
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

}
