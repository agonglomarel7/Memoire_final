import 'package:get/get.dart';

import '../assistants.dart/requestAssistant.dart';
import '../models/school.dart';

class ClassController extends GetxController {
  
  String? authToken;
  List<School> _classes = [];
  List<School> get classes {
    return _classes;
  }

  Future<Map> getSchoolClass(
      {required Map data, required String id}) async {
        var response = await RequestAssistant().getRequest("schools/$id/classes", "");
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
Future<Map> getClass(
      {required String id}) async {
        var response = await RequestAssistant().getRequest("classes/$id", "");
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
  Future<Map> createClass(
      {required String id ,required Map data}) async {
        var response = await RequestAssistant().postRequest("schools/$id/classes",  "", data);
        if (response['success']){
          // _classes.add(value);
          return {
              "success": true,
              "message": "Classe créé avec succes"
            };
        }
        else{
          return {
              "success": false,
              "message": response['message']
            };
        }
      }
  
  Future<Map> deleteClass(
      {required String id}) async {
        var response = await RequestAssistant().deleteRequest("schools/$id",  "");
        if (response['success']){
          // _classes.removeWhere((element) => element.id);
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