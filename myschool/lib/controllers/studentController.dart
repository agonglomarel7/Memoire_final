import 'package:get/get.dart';
import 'package:myschool/controllers/authController.dart';
import 'package:myschool/models/student.dart';

import '../assistants.dart/requestAssistant.dart';

class StudentController extends GetxController {
  String? authToken;
  final _students = <Student>[].obs;
  final RxInt _scolarite_total = 0.obs;
  final RxInt _scolarite_total_rest = 0.obs;
  final RxInt _scolarite_total_paye = 0.obs;
  RxList get students {
    return _students;
  }

  RxInt get scolarite_total_rest {
    return _scolarite_total_rest;
  }

  RxInt get scolarite_total_paye {
    return _scolarite_total_paye;
  }

  RxInt get scolarite_total {
    return _scolarite_total;
  }

  Future<Map> getSchoolClassStudent(
      {required Map data, required String id}) async {
    var response =
        await RequestAssistant().getRequest("classes/$id/students", "");
    if (response['success']) {
      return response['success'];
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> getStudent({required String id}) async {
    var response = await RequestAssistant().getRequest("students/$id", "");
    if (response['success']) {
      return response['success'];
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> getStudentByParent({required String id}) async {
    var response = await RequestAssistant()
        .getRequest("users/$id/students", Get.find<AuthController>().token);
    if (response['success']) {
      _students.value = [];
      for (var element in response["response"]["students"]) {
        _students.add(Student.fromJson(element));
      }
      _scolarite_total_rest.value =
          response["response"]["scolarite_total_rest"];
      _scolarite_total.value = response["response"]["scolarite_total"];
      _scolarite_total_paye.value =
          response["response"]["scolarite_total_paye"];
      return {"success": true, "data": _students};
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> createStudent({required String id, required Map data}) async {
    var response =
        await RequestAssistant().postRequest("classes/$id/students", "", data);
    if (response['success']) {
      return {"success": true, "message": "Eleve créé avec succes"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> linkStudent({required String id, required Map data}) async {
    var response =
        await RequestAssistant().putRequest("users/$id/link", Get.find<AuthController>().token, data);
    print(response);
    if (response['success']) {
      return {"success": true, "message": "Eleve créé avec succes"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> deleteStudent({required String id}) async {
    var response = await RequestAssistant().deleteRequest("students/$id", "");
    if (response['success']) {
      return {"success": true, "message": "Suppression reussie"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }
}
