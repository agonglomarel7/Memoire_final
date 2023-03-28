class Matiere {
  int? id;
  String? matiere;
  int? idEcole;
  String? createdAt;

  Matiere({this.id, this.matiere, this.idEcole, this.createdAt});

  Matiere.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matiere = json['matiere'];
    idEcole = json['id_ecole'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['matiere'] = matiere;
    data['id_ecole'] = idEcole;
    data['created_at'] = createdAt;
    return data;
  }
}