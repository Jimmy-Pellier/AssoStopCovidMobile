// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Equipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipe _$EquipeFromJson(Map<String, dynamic> json) {
  return Equipe()
    ..id = json['id'] as int
    ..code = json['code'] as String
    ..designation = json['designation'] as String
    ..categorieDesignation = json['categorieDesignation'] as String
    ..nbJoueur = json['nbJoueur'] as int
    ..entraineur = json['entraineur'] as String
    ..personnes = (json['personnes'] as List)?.map((e) => e == null ? null : PersonneElt.fromJson(e as Map<String, dynamic>))?.toList();
}

Map<String, dynamic> _$EquipeToJson(Equipe instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'designation': instance.designation,
      'categorieDesignation': instance.categorieDesignation,
      'nbJoueur': instance.nbJoueur,
      'entraineur': instance.entraineur,
      'personnes': instance.personnes,
    };
