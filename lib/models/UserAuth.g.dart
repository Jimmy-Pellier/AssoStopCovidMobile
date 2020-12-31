// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserAuth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuth _$UserAuthFromJson(Map<String, dynamic> json) {
  return UserAuth()
    ..id = json['id'] as int
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..username = json['username'] as String
    ..token = json['token'] as String
    ..refreshToken = json['refreshToken'] as String;
}

Map<String, dynamic> _$UserAuthToJson(UserAuth instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
