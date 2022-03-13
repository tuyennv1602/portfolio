import '../data.dart';

abstract class LocalRepository {
  Future<SummaryEnitity> getSummary();

  Future<List<SkillsEntity>> getSkills();

  Future<List<ExperienceEntity>> getExperiences();

  Future<List<EducationEntity>> getEducations();

  Future<List<ProjectEntity>> getProjects();

  Future<List<ContactEntity>> getContacts();
}

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSource _localDataSource;

  LocalRepositoryImpl(this._localDataSource);

  @override
  Future<SummaryEnitity> getSummary() async {
    final _model = await _localDataSource.getSummary();
    return _model.toEntity;
  }

  @override
  Future<List<SkillsEntity>> getSkills() async {
    final _model = await _localDataSource.getSkills();
    return _model.map((m) => m.toEntity).toList();
  }

  @override
  Future<List<ExperienceEntity>> getExperiences() async {
    final _model = await _localDataSource.getExperiences();
    return _model.map((m) => m.toEntity).toList();
  }

  @override
  Future<List<EducationEntity>> getEducations() async {
    final _model = await _localDataSource.getEducations();
    return _model.map((m) => m.toEntity).toList();
  }

  @override
  Future<List<ProjectEntity>> getProjects() async {
    final _model = await _localDataSource.getProjects();
    return _model.map((m) => m.toEntity).toList();
  }

  @override
  Future<List<ContactEntity>> getContacts() async {
    final _model = await _localDataSource.getContacts();
    return _model.map((m) => m.toEntity).toList();
  }
}
