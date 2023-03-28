import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myschool/widgets/loadingWidget.dart';
import '../constants.dart';
import '../controllers/messageController.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({Key? key}) : super(key: key);
  static String routeName = 'SuggestionScreen';

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  TextEditingController messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final MessageController messageController = Get.put(MessageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des messages"),
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
              child: FutureBuilder(
                future: messageController.getSchoolMessages(
                  id: "1",
                ),
                initialData: messageController.messages,
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
                          itemCount: messageController.messages.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    messageController.messages[index].contenu!,
                                    softWrap: true,
                                    style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ));
                          });
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _showFormDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Envoyer un message"),
            content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: messageController,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: kInputTextStyle,
                        decoration: const InputDecoration(
                          labelText: 'Message *',
                          hintText: 'Entrer votre message',
                          hintStyle: TextStyle(color: Colors.grey),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) {
                          //for validation
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Annuler');
                  },
                  child: const Text(
                    "Annuler",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Get.dialog(const Loading());
                        return Get.find<MessageController>().createMessage(
                            schoolId: "1",
                            data: {"message": messageController.text}).then((value){
                          Get.back();Get.back();
                          Get.snackbar("Message", value['message'], snackPosition: SnackPosition.BOTTOM);
                      });
                    }
                  },
                  child: const Text(
                    "Envoyer",
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          );
        });
  }
}
