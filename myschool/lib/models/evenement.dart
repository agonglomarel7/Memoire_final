class Evenement {
  int? id;
  String? motif;
  String? contenu;
  String? dateDebutEvenement;
  String? dateFinEvenement;
  String? lieu;
  int? idEcole;
  String? createdAt;

  Evenement(
      {this.id,
      this.motif,
      this.contenu,
      this.dateDebutEvenement,
      this.dateFinEvenement,
      this.lieu,
      this.idEcole,
      this.createdAt});

  Evenement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    motif = json['motif'];
    contenu = json['contenu'];
    dateDebutEvenement = json['date_debut_evenement'];
    dateFinEvenement = json['date_fin_evenement'];
    lieu = json['lieu'];
    idEcole = json['id_ecole'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['motif'] = motif;
    data['contenu'] = contenu;
    data['date_debut_evenement'] = dateDebutEvenement;
    data['date_fin_evenement'] = dateFinEvenement;
    data['lieu'] = lieu;
    data['id_ecole'] = idEcole;
    data['created_at'] = createdAt;
    return data;
  }
}