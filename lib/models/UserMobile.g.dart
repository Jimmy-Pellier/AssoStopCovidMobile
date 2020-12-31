// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserMobile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMobile _$UserMobileFromJson(Map<String, dynamic> json) {
  return UserMobile(
    userName: json['userName'] as String,
    prenom: json['prenom'] as String,
    nom: json['nom'] as String,
  )
    ..image = json['image'] as String
    ..qrcode = json['qrcode'] as String;
}

Map<String, dynamic> _$UserMobileToJson(UserMobile instance) => <String, dynamic>{
      'nom': instance.nom,
      'image': instance.image,
      'prenom': instance.prenom,
      'userName': instance.userName,
      'qrcode': instance.qrcode,
    };
