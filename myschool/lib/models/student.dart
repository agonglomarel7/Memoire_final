class Student {
  int? id;
  String? matricule;
  String? prenoms;
  String? nom;
  int? idClasse;
  int? scolaritePaye;
  String? nomPrenomsPere;
  String? nomPrenomsMere;
  String? idPere;
  String? idMere;

  Student(
      {this.id,
      this.matricule,
      this.prenoms,
      this.nom,
      this.idClasse,
      this.scolaritePaye,
      this.nomPrenomsPere,
      this.nomPrenomsMere,
      this.idPere,
      this.idMere});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricule = json['matricule'];
    prenoms = json['prenoms'];
    nom = json['nom'];
    idClasse = json['id_classe'];
    scolaritePaye = json['scolarite_paye'];
    nomPrenomsPere = json['nom_prenoms_pere'];
    nomPrenomsMere = json['nom_prenoms_mere'];
    idPere = json['id_pere'];
    idMere = json['id_mere'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['matricule'] = matricule;
    data['prenoms'] = prenoms;
    data['nom'] = nom;
    data['id_classe'] = idClasse;
    data['scolarite_paye'] = scolaritePaye;
    data['nom_prenoms_pere'] = nomPrenomsPere;
    data['nom_prenoms_mere'] = nomPrenomsMere;
    data['id_pere'] = idPere;
    data['id_mere'] = idMere;
    return data;
  }
}