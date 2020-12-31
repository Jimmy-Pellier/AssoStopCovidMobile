// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Personne.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Personne _$PersonneFromJson(Map<String, dynamic> json) {
  return Personne()
    ..personneId = json['personneId'] as int
    ..numeroLicence = json['numeroLicence'] as String
    ..prenom = json['prenom'] as String
    ..nom = json['nom'] as String
    ..equipeId = json['equipeId'] as int
    ..userId = json['userId'] as int
    ..estJoueur = json['estJoueur'] as bool
    ..estEntraineur = json['estEntraineur'] as bool
    ..associationId = json['associationId'] as int
    ..dateDelete = json['dateDelete'] == null ? null : DateTime.parse(json['dateDelete'] as String)
    ..isDeleted = json['isDeleted'] as bool;
}

Map<String, dynamic> _$PersonneToJson(Personne instance) => <String, dynamic>{
      'personneId': instance.personneId,
      'numeroLicence': instance.numeroLicence,
      'prenom': instance.prenom,
      'nom': instance.nom,
      'equipeId': instance.equipeId,
      'userId': instance.userId,
      'estJoueur': instance.estJoueur,
      'estEntraineur': instance.estEntraineur,
      'associationId': instance.associationId,
      'dateDelete': instance.dateDelete?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };
