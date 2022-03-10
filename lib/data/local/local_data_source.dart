import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../data.dart';

const _summaryData = 'assets/data/summary.json';
const _skillsData = 'assets/data/skills.json';
const _experienceData = 'assets/data/experience.json';
const _educationData = 'assets/data/education.json';
const _projectsData = 'assets/data/projects.json';

class LocalDataSource {
  Future<SummaryModel> getSummary() async {
    final resp = await rootBundle.loadString(_summaryData);
    return SummaryModel.fromJson(jsonDecode(resp));
  }

  Future<List<SkillsModel>> getSkills() async {
    final resp = await rootBundle.loadString(_skillsData);
    return (jsonDecode(resp) as List).map((data) => SkillsModel.fromJson(data)).toList();
  }

  Future<List<ExperienceModel>> getExperiences() async {
    final resp = await rootBundle.loadString(_experienceData);
    return (jsonDecode(resp) as List).map((data) => ExperienceModel.fromJson(data)).toList();
  }

  Future<List<EducationModel>> getEducations() async {
    final resp = await rootBundle.loadString(_educationData);
    return (jsonDecode(resp) as List).map((data) => EducationModel.fromJson(data)).toList();
  }

  Future<List<ProjectModel>> getProjects() async {
    final resp = await rootBundle.loadString(_projectsData);
    return (jsonDecode(resp) as List).map((data) => ProjectModel.fromJson(data)).toList();
  }
}
