import 'package:get/get.dart';
import 'package:myschool/models/evenement.dart';
import 'package:myschool/models/punition.dart';

import '../assistants.dart/requestAssistant.dart';
import 'authController.dart';

class PunitionController extends GetxController {
  String? authToken;
  final List<Punition> _punitions = [];
  List<Punition> get punitions {
    return _punitions;
  }

  Future<Map> getStudentPunition({required String id}) async {
    var response = await RequestAssistant()
        .getRequest("students/$id/punitions", Get.find<AuthController>().token);
    print(response);
    if (response['success']) {
      if (response['response'] == []) {
        // return ;
      }
      print("object succes");
      _punitions.clear();
      for (var punition in response['response']) {
        _punitions.add(Punition.fromJson(punition));
      }
      print(_punitions);
      return response;
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> getPunitionsPerField({required String id}) async {
    var response = await RequestAssistant().getRequest("students/$id/matieres/$id/punitions", "");
    if (response['success']) {
      return response['success'];
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> deletePunition({required String id}) async {
    var response = await RequestAssistant().deleteRequest("punitions/$id", "");
    if (response['success']) {
      return {"success": true, "message": "Suppression reussie"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }
}
