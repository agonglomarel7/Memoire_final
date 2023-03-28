class Note {
  int? id;
  int? idEleve;
  int? note;
  String? type;
  String? matiere;
  int? idMatiere;
  String? createdAt;

  Note(
      {this.id,
      this.idEleve,
      this.note,
      this.type,
        this.matiere,
      this.idMatiere,
      this.createdAt});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idEleve = json['id_eleve'];
    note = json['note'];
    type = json['type'];
    matiere = json['matiere'];
    idMatiere = json['id_matiere'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_eleve'] = idEleve;
    data['note'] = note;
    data['type'] = type;
    data['matiere'] = matiere;
    data['id_matiere'] = idMatiere;
    data['created_at'] = createdAt;
    return data;
  }
}
