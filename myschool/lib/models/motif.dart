class Motif {
  int? id;
  String? motif;
  int? montantMotif;
  int? idEcole;
  String? createdAt;

  Motif({this.id, this.motif, this.montantMotif, this.idEcole, this.createdAt});

  Motif.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    motif = json['motif'];
    montantMotif = json['montant_motif'];
    idEcole = json['id_ecole'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['motif'] = motif;
    data['montant_motif'] = montantMotif;
    data['id_ecole'] = idEcole;
    data['created_at'] = createdAt;
    return data;
  }
}