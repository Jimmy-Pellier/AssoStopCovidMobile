abstract class IModel {
  Map<String, dynamic> toJson();

  IModel fromJson(Map<String, dynamic> json);
}
