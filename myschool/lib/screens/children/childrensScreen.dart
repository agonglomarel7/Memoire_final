import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myschool/discipline/disciplineScreen.dart';
import 'package:myschool/screens/notes/noteScreen.dart';
import 'package:myschool/screens/fee_screen/fee_screen.dart';

import '../../constants.dart';
import '../../controllers/studentController.dart';

class ChildrensScreen extends StatelessWidget {
  ChildrensScreen({super.key});
  static String routeName = 'ChildrensScreen';

  final StudentController studentControler = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste de vos enfants"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: ListView.builder(
                itemCount: studentControler.students.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                   // onTap: (){ Get.to(()=>const DateSheetScreen());},
                    child: Card(
                                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Text(studentControler.students[index].matricule,textAlign: TextAlign.center, style: const TextStyle(color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.w700),)),
                        Text("Noms: ${studentControler.students[index].nom}", style: const TextStyle(color: kPrimaryColor, fontSize: 16),),
                        Text("Prénoms: ${studentControler.students[index].prenoms}", style: const TextStyle(color: kPrimaryColor, fontSize: 15),),
                        Text("Scolarité payée: ${studentControler.students[index].scolaritePaye}", style: const TextStyle(color: kPrimaryColor, fontSize: 15),),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      blurRadius: 5
                                  )]
                              ),
                              width: 100,
                              height: 35,
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FeeScreen()));
                                  },
                                  child: Text("Scolarité",style: TextStyle(fontSize: 20),)),),
                            Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2,
                                  blurRadius: 5
                                )]

                              ),
                            width: 100,
                            height: 35,
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteScreen(studentId: studentControler.students[index].id.toString())));

                                  },
                                  child: Text("Note",style: TextStyle(fontSize: 20),)),),
                            Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      blurRadius: 5
                                  )]
                              ),
                            width: 100,
                            height: 35,
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DisciplineScreen(studentId: studentControler.students[index].id.toString())));
                                  },
                                  child: Text("Discipline",style: TextStyle(fontSize: 20),)),)
                          ],
                        )
                      ],
                    ),
                                  ),
                    ),
                  );
                },
              ),)
          ),
        ],
      ),
    );
  }
}
