// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationModel _$EducationModelFromJson(Map<String, dynamic> json) =>
    EducationModel(
      school: json['school'] as String,
      logo: json['logo'] as String,
      institute: json['institute'] as String,
      department: json['department'] as String,
      time: json['time'] as String,
      degree: json['degree'] as String,
    );

Map<String, dynamic> _$EducationModelToJson(EducationModel instance) =>
    <String, dynamic>{
      'school': instance.school,
      'logo': instance.logo,
      'institute': instance.institute,
      'department': instance.department,
      'time': instance.time,
      'degree': instance.degree,
    };
