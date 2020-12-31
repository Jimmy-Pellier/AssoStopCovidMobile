import 'package:assostopcovidmobile/models/IModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Personne.g.dart';

@JsonSerializable()
class Personne implements IModel {
  int personneId;
  String numeroLicence;
  String prenom;
  String nom;
  int equipeId;
  int userId;
  bool estJoueur;
  bool estEntraineur;
  int associationId;
  DateTime dateDelete;
  bool isDeleted;

  Personne();

  @override
  Map<String, dynamic> toJson() => _$PersonneToJson(this);

  @override
  Personne fromJson(Map<String, dynamic> json) {
    var jsonObject = _$PersonneFromJson(json);
    personneId = jsonObject.personneId;
    numeroLicence = jsonObject.numeroLicence;
    prenom = jsonObject.prenom;
    nom = jsonObject.nom;
    equipeId = jsonObject.equipeId;
    userId = jsonObject.userId;
    estJoueur = jsonObject.estJoueur;
    estEntraineur = jsonObject.estEntraineur;
    associationId = jsonObject.associationId;
    dateDelete = jsonObject.dateDelete;
    isDeleted = jsonObject.isDeleted;

    return jsonObject;
  }
}
