import 'package:get/get.dart';

import '../assistants.dart/requestAssistant.dart';
import '../models/school.dart';

class MatiereController extends GetxController {
  
  String? authToken;
  final List<School> _matieres = [];
  List<School> get matieres {
    return _matieres;
  }

  Future<Map> getSchoolMatieres(
      {required Map data, required String id}) async {
        var response = await RequestAssistant().getRequest("schools/$id/matieres", "");
        if (response['success']){
          return response['success'];
        }
        else{
          return {
              "success": false,
              "message": response['message']
            };
        }
      }
Future<Map> getMatiere(
      {required String id}) async {
        var response = await RequestAssistant().getRequest("matieres/$id", "");
        if (response['success']){      
          return response['success'];
        }
        else{
          return {
              "success": false,
              "message": response['message']
            };
        }
      }
  Future<Map> createMatiere(
      {required String id ,required Map data}) async {
        var response = await RequestAssistant().postRequest("schools/$id/matieres",  "", data);
        if (response['success']){
          return {
              "success": true,
              "message": "Matiere créé avec succes"
            };
        }
        else{
          return {
              "success": false,
              "message": response['message']
            };
        }
      }
  
  Future<Map> deleteMatiere(
      {required String id}) async {
        var response = await RequestAssistant().deleteRequest("matieres/$id",  "");
        if (response['success']){
          return {
              "success": true,
              "message": "Suppression reussie"
            };
        }
        else{
          return {
              "success": false,
              "message": response['message']
            };
        }
      }
  
}