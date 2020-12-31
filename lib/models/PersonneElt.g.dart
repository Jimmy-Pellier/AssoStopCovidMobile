// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PersonneElt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonneElt _$PersonneEltFromJson(Map<String, dynamic> json) {
  return PersonneElt()
    ..personneId = json['personneId'] as int
    ..prenom = json['prenom'] as String
    ..nom = json['nom'] as String
    ..estJoueur = json['estJoueur'] as bool
    ..estEntraineur = json['estEntraineur'] as bool;
}

Map<String, dynamic> _$PersonneEltToJson(PersonneElt instance) => <String, dynamic>{
      'personneId': instance.personneId,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'estJoueur': instance.estJoueur,
      'estEntraineur': instance.estEntraineur,
    };
