import 'package:get/get.dart';
import 'package:myschool/assistants.dart/requestAssistant.dart';

import '../models/user.dart';

class AuthController extends GetxController {
  String? _token;
  User? _user;

  User get user {
    return _user!;
  }

  String get token {
    return _token ?? "";
  }

  Future<Map> signUp({required Map data}) async {
    var response = await RequestAssistant().postRequest("signup", "", data);
    if (response['success']) {
      return {"success": true, "message": "Compte créé avec succes"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> login({required Map data}) async {
    Map response = await RequestAssistant().postRequest("login", "", data);
    if (response['success']) {
      _token = response['token'];
      _user = User.fromJson(response['user']);
      return {"success": true, "message": "Authentification reussie"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> getUser({required String id}) async {
    var response = await RequestAssistant().getRequest("users/$id", "");
    if (response['success']) {
      return {"success": true, "message": "Authentification reussie"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> deleteUser({required String id}) async {
    var response = await RequestAssistant().deleteRequest("users/$id", "");
    if (response['success']) {
      return {"success": true, "message": "Suppression reussie"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }
}
