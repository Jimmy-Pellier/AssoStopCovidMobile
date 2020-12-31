import 'package:json_annotation/json_annotation.dart';

part 'PersonneElt.g.dart';

@JsonSerializable()
class PersonneElt {
  int personneId;
  String prenom;
  String nom;
  bool estJoueur;
  bool estEntraineur;

  PersonneElt();
  factory PersonneElt.fromJson(Map<String, dynamic> json) => _$PersonneEltFromJson(json);

  Map<String, dynamic> toJson() => _$PersonneEltToJson(this);
}
