import 'package:json_annotation/json_annotation.dart';

import 'IModel.dart';

part 'User.g.dart';

@JsonSerializable()
class User implements IModel {
  String username;
  String password;
  String keyMobile;

  User({this.username, this.password, this.keyMobile});

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  User fromJson(Map<String, dynamic> json) {
    var jsonObject = _$UserFromJson(json);
    username = jsonObject.username;
    password = jsonObject.password;
    keyMobile = jsonObject.keyMobile;
    return jsonObject;
  }
}
