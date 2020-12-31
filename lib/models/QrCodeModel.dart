import 'package:json_annotation/json_annotation.dart';

import 'IModel.dart';

part 'QrCodeModel.g.dart';

@JsonSerializable()
class QrCodeModel implements IModel {
  String code;

  QrCodeModel({this.code});

  @override
  Map<String, dynamic> toJson() => _$QrCodeModelToJson(this);

  @override
  QrCodeModel fromJson(Map<String, dynamic> json) {
    var jsonObject = _$QrCodeModelFromJson(json);
    code = jsonObject.code;
    return jsonObject;
  }
}
