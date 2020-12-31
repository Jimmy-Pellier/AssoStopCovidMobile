// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Evenement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evenement _$EvenementFromJson(Map<String, dynamic> json) {
  return Evenement()
    ..id = json['id'] as int
    ..typeEvenementId = json['typeEvenementId'] as int
    ..designationType = json['designationType'] as String
    ..dateEvenement = json['dateEvenement'] == null ? null : DateTime.parse(json['dateEvenement'] as String)
    ..associationId = json['associationId'] as int
    ..equipeId = json['equipeId'] as int
    ..designationEquipe = json['designationEquipe'] as String
    ..estPresent = json['estPresent'] as bool
    ..estValide = json['estValide'] as bool;
}

Map<String, dynamic> _$EvenementToJson(Evenement instance) => <String, dynamic>{
      'id': instance.id,
      'typeEvenementId': instance.typeEvenementId,
      'designationType': instance.designationType,
      'dateEvenement': instance.dateEvenement?.toIso8601String(),
      'associationId': instance.associationId,
      'equipeId': instance.equipeId,
      'designationEquipe': instance.designationEquipe,
      'estPresent': instance.estPresent,
      'estValide': instance.estValide,
    };
