import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/evenementController.dart';

class EvenementScreen extends StatelessWidget {
  const EvenementScreen({Key? key}) : super(key: key);
  static String routeName = 'EvenementScreen';

  @override
  Widget build(BuildContext context) {
    final EvenementController evenementController =
    Get.put(EvenementController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des activités"),
      ),

      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: FutureBuilder(
                future: evenementController.getSchoolEvents(
                  id: "1",
                ),
                initialData: evenementController.evenements,
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
                          itemCount: evenementController.evenements.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        evenementController.evenements[index].motif!,softWrap: true,
                                        style: const TextStyle(color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(softWrap: true,
                                        evenementController.evenements[index].contenu!,
                                        style: const TextStyle(color: kTextBlackColor, fontSize: 14),
                                      ),
                                      SizedBox(height: 10,),
                                      Row(children: [
                                        Expanded(
                                          child: Text(softWrap: true,
                                            "Lieu: ${evenementController.evenements[index].lieu!}",
                                            style: const TextStyle(color: kPrimaryColor, fontSize: 16),
                                          ),
                                        ),Column(
                                          children: [
                                            Text(
                                              "De: ${evenementController.evenements[index].dateDebutEvenement!.substring(0, 10)}",
                                              style: const TextStyle(color: kPrimaryColor, fontSize: 12),
                                            ),Text(
                                              "A: ${evenementController.evenements[index].dateFinEvenement!.substring(0, 10)}",
                                              style: const TextStyle(color: kPrimaryColor, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],)
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