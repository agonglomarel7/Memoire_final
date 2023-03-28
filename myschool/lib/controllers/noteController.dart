import 'package:get/get.dart';
import '../assistants.dart/requestAssistant.dart';
import '../models/note.dart';
import 'authController.dart';

class NoteController extends GetxController {
  final List<Note> _notes = [];
  List<Note> get notes {
    return _notes;
  }

  Future<Map> getStudentNotes({required String id}) async {
    var response = await RequestAssistant()
        .getRequest("students/$id/notes", Get.find<AuthController>().token);
    print(response);
    if (response['success']) {
      if (response['response'] == []) {
        // return ;
      }
      print("object succes");
      _notes.clear();
      for (var note in response['response']) {
        _notes.add(Note.fromJson(note));
      }
      print(_notes);
      return response;
    } else {
      return {"success": false, "message": response['message']};
    }
  }

}
