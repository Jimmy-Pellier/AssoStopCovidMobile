import 'package:assostopcovidmobile/models/IModel.dart';
import 'package:assostopcovidmobile/models/PersonneElt.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Equipe.g.dart';

@JsonSerializable()
class Equipe implements IModel {
  int id;
  String code;
  String designation;
  String categorieDesignation;
  int nbJoueur;
  String entraineur;

  List<PersonneElt> personnes;

  Equipe();

  @override
  Map<String, dynamic> toJson() => _$EquipeToJson(this);

  @override
  Equipe fromJson(Map<String, dynamic> json) {
    var jsonObject = _$EquipeFromJson(json);
    id = jsonObject.id;
    code = jsonObject.code;
    designation = jsonObject.designation;
    categorieDesignation = jsonObject.categorieDesignation;
    nbJoueur = jsonObject.nbJoueur;
    personnes = jsonObject.personnes;
    entraineur = jsonObject.entraineur;
    return jsonObject;
  }
}
