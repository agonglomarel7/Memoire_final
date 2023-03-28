
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myschool/controllers/punitionController.dart';

import '../constants.dart';

class DisciplineScreen extends StatelessWidget {
  const DisciplineScreen({Key? key, required this.studentId}) : super(key: key);
  final String studentId;
  static String routeName = 'DisciplineScreen';

  @override
  Widget build(BuildContext context) {
    final PunitionController punitionController =
    Get.put(PunitionController());
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Discipline de votre enfant"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: FutureBuilder(
                future: punitionController.getStudentPunition(
                  id: studentId,
                ),
                initialData: punitionController.punitions,
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
                          itemCount: punitionController.punitions.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(punitionController.punitions[index].motif!,softWrap: true,
                                      style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                      ),),
                                      SizedBox(height: 15,),
                                      Text(
                                        punitionController.punitions[index]
                                            .punition!, softWrap: true,
                                        style: const TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 15,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            punitionController.punitions[index]
                                                .date!, softWrap: true,
                                            style: const TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
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