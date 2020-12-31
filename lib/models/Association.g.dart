// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Association.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Association _$AssociationFromJson(Map<String, dynamic> json) {
  return Association()
    ..id = json['id'] as int
    ..designation = json['designation'] as String
    ..logo = json['logo'] as String
    ..color = json['color'] as String;
}

Map<String, dynamic> _$AssociationToJson(Association instance) => <String, dynamic>{
      'id': instance.id,
      'designation': instance.designation,
      'logo': instance.logo,
      'color': instance.color,
    };
