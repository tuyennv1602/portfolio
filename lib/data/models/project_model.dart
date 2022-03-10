import 'package:json_annotation/json_annotation.dart';
import 'package:my_portfolio/data/data.dart';
part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  final String name;
  final String client;
  final String label;
  final String description;
  final List<String> responsibility;
  final String role;
  final String size;
  final String duration;
  final String technology;
  final String platform;

  ProjectModel({
    required this.name,
    required this.client,
    required this.label,
    required this.description,
    required this.responsibility,
    required this.role,
    required this.size,
    required this.duration,
    required this.technology,
    required this.platform,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> data) => _$ProjectModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}

extension ProjectModelExt on ProjectModel {
  ProjectEntity get toEntity {
    return ProjectEntity(
      name: name,
      client: client,
      label: label,
      description: description,
      responsibility: responsibility,
      role: role,
      size: size,
      duration: duration,
      technology: technology,
      platform: platform,
    );
  }
}
