// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      name: json['name'] as String,
      client: json['client'] as String,
      label: json['label'] as String,
      description: json['description'] as String,
      responsibility: (json['responsibility'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      role: json['role'] as String,
      size: json['size'] as String,
      duration: json['duration'] as String,
      technology: json['technology'] as String,
      platform: json['platform'] as String,
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'client': instance.client,
      'label': instance.label,
      'description': instance.description,
      'responsibility': instance.responsibility,
      'role': instance.role,
      'size': instance.size,
      'duration': instance.duration,
      'technology': instance.technology,
      'platform': instance.platform,
    };
