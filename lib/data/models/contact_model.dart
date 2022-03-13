import 'package:json_annotation/json_annotation.dart';

import '../data.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  final String icon;
  final String name;
  final String? link;

  ContactModel({required this.icon, required this.name, this.link});

  factory ContactModel.fromJson(Map<String, dynamic> data) => _$ContactModelFromJson(data);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}

extension ContactModelExt on ContactModel {
  ContactEntity get toEntity {
    return ContactEntity(icon: icon, name: name, link: link);
  }
}
