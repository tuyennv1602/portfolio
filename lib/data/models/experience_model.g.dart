// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) =>
    ExperienceModel(
      companyName: json['company_name'] as String,
      companyLogo: json['company_logo'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String?,
      timelines: (json['timelines'] as List<dynamic>)
          .map((e) => TimelineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      contract: json['contract'] as String,
    );

Map<String, dynamic> _$ExperienceModelToJson(ExperienceModel instance) =>
    <String, dynamic>{
      'company_name': instance.companyName,
      'company_logo': instance.companyLogo,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'timelines': instance.timelines.map((e) => e.toJson()).toList(),
      'contract': instance.contract,
    };
