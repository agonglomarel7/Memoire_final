class Classe {
  int? id;
  String? nom;
  int? scolarite;
  int? idEcole;
  String? createdAt;

  Classe({this.id, this.nom, this.scolarite, this.idEcole, this.createdAt});

  Classe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    scolarite = json['scolarite'];
    idEcole = json['id_ecole'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['scolarite'] = scolarite;
    data['id_ecole'] = idEcole;
    data['created_at'] = createdAt;
    return data;
  }
}