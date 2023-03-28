import 'package:get/get.dart';

import '../assistants.dart/requestAssistant.dart';
import '../models/school.dart';

class SchoolController extends GetxController {
  
  String? authToken;
  List<School> _schools = [];
  List<School> get schools {
    return _schools;
  }

  Future<Map> getAllSchools(
      {required Map data}) async {
        var response = await RequestAssistant().getRequest("schools", "");
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
Future<Map> getSchool(
      {required String id}) async {
        var response = await RequestAssistant().getRequest("schools/$id", "");
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
  Future<Map> createSchool(
      {required String id ,required Map data}) async {
        var response = await RequestAssistant().postRequest("schools",  "", data);
        if (response['success']){
          return {
              "success": true,
              "message": "Creation reussie"
            };
        }
        else{
          return {
              "success": false,
              "message": response['message']
            };
        }
      }
  
  Future<Map> deleteSchool(
      {required String id}) async {
        var response = await RequestAssistant().deleteRequest("schools/$id",  "");
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