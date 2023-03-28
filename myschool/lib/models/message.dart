import 'dart:convert';

class Message {
  int? id;
  String? contenu;
  int? idEcole;
  int? idUser;
  String? createdAt;

  Message(
      {this.id,
        this.contenu,
        this.idEcole,
        this.idUser,
        this.createdAt});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contenu = json['message'];
    idEcole = json['id_ecole'];
    idUser = json ['id_utilisateur'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = contenu;
    data['id_ecole'] = idEcole;
    data['id_utilisateur'] = idUser;
    data['created_at'] = createdAt;
    return data;
  }
}