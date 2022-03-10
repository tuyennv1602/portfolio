import 'package:my_portfolio/data/data.dart';

class ProjectEntity {
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

  ProjectEntity({
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
}

extension ProjectEntityExt on ProjectEntity {
  ProjectModel get toModel {
    return ProjectModel(
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
