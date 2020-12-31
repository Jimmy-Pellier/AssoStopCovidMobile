import 'package:assostopcovidmobile/models/IModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Association.g.dart';

@JsonSerializable()
class Association implements IModel {
  int id;
  String designation;
  String logo;
  String color;

  Association();

  @override
  Map<String, dynamic> toJson() => _$AssociationToJson(this);

  @override
  Association fromJson(Map<String, dynamic> json) {
    var jsonObject = _$AssociationFromJson(json);
    id = jsonObject.id;
    designation = jsonObject.designation;
    logo = jsonObject.logo;
    color = jsonObject.color;

    return jsonObject;
  }
}
