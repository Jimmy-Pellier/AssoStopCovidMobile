import 'package:json_annotation/json_annotation.dart';

import 'IModel.dart';

part 'UserMobile.g.dart';

@JsonSerializable()
class UserMobile implements IModel {
  String nom;
  String image;
  String prenom;
  String userName;
  String qrcode;

  UserMobile({this.userName, this.prenom, this.nom});

  @override
  Map<String, dynamic> toJson() => _$UserMobileToJson(this);

  @override
  UserMobile fromJson(Map<String, dynamic> json) {
    var jsonObject = _$UserMobileFromJson(json);
    userName = jsonObject.userName;
    prenom = jsonObject.prenom;
    image = jsonObject.image;
    nom = jsonObject.nom;
    return jsonObject;
  }
}
