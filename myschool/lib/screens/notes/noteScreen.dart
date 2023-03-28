
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import '../../controllers/noteController.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key, required this.studentId}) : super(key: key);
  final String studentId;
  static String routeName = 'NoteScreen';

  @override
  Widget build(BuildContext context) {
    final NoteController noteController =
    Get.put(NoteController());
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Voir les notes "),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 100.w,
            height: 5.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                color: kOtherColor,
                //reusable radius,
                borderRadius: kTopBorderRadius,
              ),
              child: FutureBuilder(
                future: noteController.getStudentNotes(
              id: studentId,
                ),
                initialData: noteController.notes,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.error != null) {
                  return const Center(
                    child: Text(
                      'Erreur Erreur',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: noteController.notes.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    "Matière: ${ noteController.notes[index]
                                        .matiere!}", softWrap: true,
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                   "Evaluation: ${ noteController.notes[index]
                                        .type!}", softWrap: true,
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    "Note: ${noteController.notes[index]
                                        .note!}", softWrap: true,
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],),
                            )
                        );
                      });
                }
              }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
