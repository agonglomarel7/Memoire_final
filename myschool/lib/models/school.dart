class School {
  int? id;
  String? nom;
  String? email;
  String? contact;
  String? adresse;
  String? idSlug;
  String? createdAt;

  School(
      {this.id,
      this.nom,
      this.email,
      this.contact,
      this.adresse,
      this.idSlug,
      this.createdAt});

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    email = json['email'];
    contact = json['contact'];
    adresse = json['adresse'];
    idSlug = json['id_slug'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['email'] = email;
    data['contact'] = contact;
    data['adresse'] = adresse;
    data['id_slug'] = idSlug;
    data['created_at'] = createdAt;
    return data;
  }
}