// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsModel _$SkillsModelFromJson(Map<String, dynamic> json) => SkillsModel(
      type: json['type'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => SkillsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$SkillsModelToJson(SkillsModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'items': instance.items,
      'icon': instance.icon,
    };
