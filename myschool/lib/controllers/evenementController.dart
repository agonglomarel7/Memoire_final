import 'package:get/get.dart';
import 'package:myschool/models/evenement.dart';

import '../assistants.dart/requestAssistant.dart';
import 'authController.dart';

class EvenementController extends GetxController {
  String? authToken;
  final List<Evenement> _evenements = [];
  List<Evenement> get evenements {
    return _evenements;
  }

  Future<Map> getSchoolEvents({required String id}) async {
    var response = await RequestAssistant()
        .getRequest("schools/$id/events", Get.find<AuthController>().token);
        print(response);
    if (response['success']) {
      if (response['response'] == []) {
        // return ;
      }
      print("object succes");
      _evenements.clear();
      for (var evenement in response['response']) {
        _evenements.add(Evenement.fromJson(evenement));
      }
      print(_evenements);
      return response;
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> getEvent({required String id}) async {
    var response = await RequestAssistant().getRequest("events/$id", "");
    if (response['success']) {
      return response['success'];
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> createEvent({required String id, required Map data}) async {
    var response =
        await RequestAssistant().postRequest("schools/$id/events", "", data);
    if (response['success']) {
      return {"success": true, "message": "Matiere créé avec succes"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> deleteEvent({required String id}) async {
    var response = await RequestAssistant().deleteRequest("events/$id", "");
    if (response['success']) {
      return {"success": true, "message": "Suppression reussie"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }
}
