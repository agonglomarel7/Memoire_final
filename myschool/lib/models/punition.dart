class Punition {
  int? id;
  int? idMatiere;
  String? motif;
  String? punition;
  int? idEleve;
  String? date;
  String? createdAt;

  Punition(
      {this.id,
        this.idMatiere,
        this.motif,
        this.punition,
        this.idEleve,
        this.date,
        this.createdAt});


  Punition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idMatiere = json['id_matiere'];
    motif = json['motif'];
    punition = json['punition'];
    idEleve = json['id_eleve'];
    date = json['date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_matiere'] = idMatiere;
    data['motif'] = motif;
    data['punition'] = punition;
    data['id_eleve']= idEleve;
    data['date'] = date;
    data['created_at'] = createdAt;
    return data;
  }
}