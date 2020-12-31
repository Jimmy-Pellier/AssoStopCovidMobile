// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role()
    ..name = json['name'] as String
    ..libelle = json['libelle'] as String
    ..description = json['description'] as String
    ..isActived = json['isActived'] as bool;
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'name': instance.name,
      'libelle': instance.libelle,
      'description': instance.description,
      'isActived': instance.isActived,
    };
