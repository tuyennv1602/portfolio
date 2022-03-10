// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsItemModel _$SkillsItemModelFromJson(Map<String, dynamic> json) =>
    SkillsItemModel(
      label: json['label'] as String,
      value:
          (json['value'] as List<dynamic>?)?.map((e) => e as String).toList(),
      point: (json['point'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SkillsItemModelToJson(SkillsItemModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'point': instance.point,
    };
