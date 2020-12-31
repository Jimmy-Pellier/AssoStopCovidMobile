import 'package:json_annotation/json_annotation.dart';

import 'IModel.dart';

part 'UserAuth.g.dart';

@JsonSerializable()
class UserAuth implements IModel {
  int id;
  String firstName;
  String lastName;
  String username;
  String token;
  String refreshToken;

  UserAuth();

  @override
  Map<String, dynamic> toJson() => _$UserAuthToJson(this);

  @override
  UserAuth fromJson(Map<String, dynamic> json) {
    var jsonObject = _$UserAuthFromJson(json);
    id = jsonObject.id;
    firstName = jsonObject.firstName;
    lastName = jsonObject.lastName;
    username = jsonObject.username;
    token = jsonObject.token;
    refreshToken = jsonObject.refreshToken;
    return jsonObject;
  }
}
