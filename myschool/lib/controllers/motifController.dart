import 'package:get/get.dart';

import '../assistants.dart/requestAssistant.dart';
import '../models/school.dart';

class MotifController extends GetxController {
  
  String? authToken;
  List<School> _motifs = [];
  List<School> get motifs {
    return _motifs;
  }

  Future<Map> getSchoolMotifs(
      {required Map data, required String id}) async {
        var response = await RequestAssistant().getRequest("schools/$id/motifs", "");
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
Future<Map> getMotif(
      {required String id}) async {
        var response = await RequestAssistant().getRequest("motifs/$id", "");
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
  Future<Map> createMotif(
      {required String id ,required Map data}) async {
        var response = await RequestAssistant().postRequest("schools/$id/motifs",  "", data);
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
  
  Future<Map> deleteMotif(
      {required String id}) async {
        var response = await RequestAssistant().deleteRequest("motifs/$id",  "");
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