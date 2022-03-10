import 'package:json_annotation/json_annotation.dart';
import 'package:my_portfolio/data/data.dart';
part 'skills_model.g.dart';

@JsonSerializable()
class SkillsModel {
  final String type;
  final List<SkillsItemModel> items;
  final String icon;

  SkillsModel({
    required this.type,
    required this.items,
    required this.icon,
  });

  factory SkillsModel.fromJson(Map<String, dynamic> data) => _$SkillsModelFromJson(data);

  Map<String, dynamic> toJson() => _$SkillsModelToJson(this);
}

extension SkillsModelExt on SkillsModel {
  SkillsEntity get toEntity {
    return SkillsEntity(
      type: type,
      items: items.map((i) => i.toEntity).toList(),
      icon: icon,
    );
  }
}
