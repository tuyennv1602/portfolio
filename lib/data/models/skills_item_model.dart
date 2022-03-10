import 'package:json_annotation/json_annotation.dart';
import 'package:my_portfolio/data/data.dart';
part 'skills_item_model.g.dart';

@JsonSerializable()
class SkillsItemModel {
  final String label;
  final List<String>? value;
  final double? point;

  SkillsItemModel({
    required this.label,
    required this.value,
    required this.point,
  });

  factory SkillsItemModel.fromJson(Map<String, dynamic> data) => _$SkillsItemModelFromJson(data);

  Map<String, dynamic> toJson() => _$SkillsItemModelToJson(this);
}

extension SkillsItemModelExt on SkillsItemModel {
  SkillsItemEntity get toEntity {
    return SkillsItemEntity(label: label, value: value, point: point);
  }
}
