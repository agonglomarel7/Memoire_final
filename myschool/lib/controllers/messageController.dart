import 'package:get/get.dart';
import '../assistants.dart/requestAssistant.dart';
import '../models/message.dart';
import 'authController.dart';

class MessageController extends GetxController {
  String? authToken;
  final List<Message> _messages = [];
  List<Message> get messages {
    return _messages;
  }


  Future<Map> getSchoolMessages({required String id}) async {
    var response = await RequestAssistant()
        .getRequest("messages", Get.find<AuthController>().token);
    print(response);
    if (response['success']) {
      if (response['response'] == []) {
        // return ;
      }
      print("object succes");
      _messages.clear();
      for (var message in response['response']) {
        _messages.add(Message.fromJson(message));
      }
      print(_messages);
      return response;
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> getMessages({required String id}) async {
    var response = await RequestAssistant().getRequest("messages/$id", "");
    if (response['success']) {
      return response['success'];
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> createMessage({required String schoolId, required Map data}) async {
    var response =
    await RequestAssistant().postRequest("users/${Get.find<AuthController>().user.id}/schools/$schoolId/messages", Get.find<AuthController>().token, data);
    if (response['success']) {
      return {"success": true, "message": "Message envoyé avec succes"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }

  Future<Map> deleteEvent({required String id}) async {
    var response = await RequestAssistant().deleteRequest("messages/$id", "");
    if (response['success']) {
      return {"success": true, "message": "Suppression reussie"};
    } else {
      return {"success": false, "message": response['message']};
    }
  }
}
