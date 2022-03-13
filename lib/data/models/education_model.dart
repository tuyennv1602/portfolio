import 'package:json_annotation/json_annotation.dart';
import 'package:my_portfolio/data/data.dart';
part 'education_model.g.dart';

@JsonSerializable()
class EducationModel {
  final String school;
  final String logo;
  final String? institute;
  final String department;
  final String time;
  final String? degree;

  EducationModel({
    required this.school,
    required this.logo,
    this.institute,
    required this.department,
    required this.time,
    this.degree,
  });

  factory EducationModel.fromJson(Map<String, dynamic> data) => _$EducationModelFromJson(data);

  Map<String, dynamic> toJson() => _$EducationModelToJson(this);
}

extension EducationModelExt on EducationModel {
  EducationEntity get toEntity {
    return EducationEntity(
      school: school,
      logo: logo,
      institute: institute,
      department: department,
      time: time,
      degree: degree,
    );
  }
}
