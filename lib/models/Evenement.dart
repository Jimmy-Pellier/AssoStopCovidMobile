import 'package:assostopcovidmobile/models/IModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Evenement.g.dart';

@JsonSerializable()
class Evenement implements IModel {
  int id;
  int typeEvenementId;
  String designationType;
  DateTime dateEvenement;
  int associationId;
  int equipeId;
  String designationEquipe;
  bool estPresent;
  bool estValide;

  Evenement();

  @override
  Map<String, dynamic> toJson() => _$EvenementToJson(this);

  @override
  Evenement fromJson(Map<String, dynamic> json) {
    var jsonObject = _$EvenementFromJson(json);
    id = jsonObject.id;
    typeEvenementId = jsonObject.typeEvenementId;
    designationType = jsonObject.designationType;
    dateEvenement = jsonObject.dateEvenement;
    associationId = jsonObject.equipeId = jsonObject.equipeId;
    designationEquipe = jsonObject.designationEquipe;
    estPresent = jsonObject.estPresent;
    estValide = jsonObject.estValide;
    return jsonObject;
  }
}
