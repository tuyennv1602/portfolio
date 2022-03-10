import 'dart:developer';
import 'package:my_portfolio/shared/utils/utils.dart';
import '../../../data/data.dart';

enum PageType { summary, experience, skills, projects, education, contact }

extension PageTypeExt on PageType {
  int get toPageIndex {
    switch (this) {
      case PageType.summary:
        return 0;
      case PageType.experience:
        return 1;
      case PageType.skills:
        return 2;
      case PageType.projects:
        return 3;
      case PageType.education:
        return 4;
      case PageType.contact:
        return 5;
      default:
        return 0;
    }
  }

  String get toPageLabel {
    switch (this) {
      case PageType.summary:
        return 'portfolio.summary';
      case PageType.experience:
        return 'portfolio.experience';
      case PageType.skills:
        return 'portfolio.skills';
      case PageType.projects:
        return 'portfolio.projects';
      case PageType.education:
        return 'portfolio.education';
      case PageType.contact:
        return 'portfolio.contact';
      default:
        return 'portfolio.summary';
    }
  }
}

extension PageTypeIndexExt on num {
  PageType get toPageType {
    switch (this) {
      case 0:
        return PageType.summary;
      case 1:
        return PageType.experience;
      case 2:
        return PageType.skills;
      case 3:
        return PageType.projects;
      case 4:
        return PageType.education;
      case 5:
        return PageType.contact;
      default:
        return PageType.summary;
    }
  }
}

class PortfolioModel extends EasyNotifier {
  final LocalRepository _localRepository;

  PortfolioModel(this._localRepository);

  /// Set page
  PageType _currentPage = PageType.summary;

  PageType get currentPage => _currentPage;
  set currentPage(PageType type) => notify(() => _currentPage = type);

  // Summary
  SummaryEnitity? _summary;
  SummaryEnitity? get summary => _summary;

  Future<void> getSummary() async {
    try {
      final _resp = await _localRepository.getSummary();
      notify(() => _summary = _resp);
    } catch (e) {
      log('Error get summary: $e');
    }
  }

  // Skills
  List<SkillsEntity>? _skills;
  List<SkillsEntity>? get skills => _skills;

  Future<void> getSkills() async {
    try {
      final _resp = await _localRepository.getSkills();
      notify(() => _skills = _resp);
    } catch (e) {
      log('Error get skills: $e');
    }
  }

  // Experiences
  List<ExperienceEntity>? _experiences;
  List<ExperienceEntity>? get experiences => _experiences;

  Future<void> getExperiences() async {
    try {
      final _resp = await _localRepository.getExperiences();
      notify(() => _experiences = _resp);
    } catch (e) {
      log('Error get experiences: $e');
    }
  }

  // Educations
  List<EducationEntity>? _educations;
  List<EducationEntity>? get educations => _educations;

  Future<void> getEducations() async {
    try {
      final _resp = await _localRepository.getEducations();
      notify(() => _educations = _resp);
    } catch (e) {
      log('Error get education: $e');
    }
  }

  // Projects
  List<ProjectEntity>? _projects;
  List<ProjectEntity>? get projects => _projects;

  Future<void> getProjects() async {
    try {
      final _resp = await _localRepository.getProjects();
      notify(() => _projects = _resp);
    } catch (e) {
      log('Error get projects: $e');
    }
  }
}
