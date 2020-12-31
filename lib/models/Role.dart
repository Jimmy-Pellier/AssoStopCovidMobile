import 'package:json_annotation/json_annotation.dart';
import 'IModel.dart';

part 'Role.g.dart';

@JsonSerializable()
class Role implements IModel {
  String name;
  String libelle;
  String description;
  bool isActived;

  Role();

  @override
  Map<String, dynamic> toJson() => _$RoleToJson(this);

  @override
  Role fromJson(Map<String, dynamic> json) {
    var jsonObject = _$RoleFromJson(json);
    name = jsonObject.name;
    libelle = jsonObject.libelle;
    description = jsonObject.description;
    isActived = jsonObject.isActived;
    return jsonObject;
  }
}
