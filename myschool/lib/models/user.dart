import 'dart:convert';

class User {
  late final int id;
  late final String nom;
  late final String prenoms;
  late final String email;
  late final String tel;
  late final String sexe;
  // late final String motDePasse;
  late final String createdAt;

  User(
      {required this.id,
      required this.nom,
      required this.prenoms,
      required this.email,
      required this.tel,
      required this.sexe,
      // required this.motDePasse,
      required this.createdAt});

  User userFromJson(String str) => User.fromJson(json.decode(str));

  String userToJson(User data) => json.encode(data.toJson());

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenoms = json['prenoms'];
    email = json['email'];
    tel = json['tel'];
    sexe = json['sexe'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenoms'] = prenoms;
    data['email'] = email;
    data['tel'] = tel;
    data['sexe'] = sexe;
    data['createdAt'] = createdAt;
    return data;
  }
}
