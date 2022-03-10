import 'package:my_portfolio/data/entities/timeline_entity.dart';

class ExperienceEntity {
  final String companyName;
  final String companyLogo;
  final String startTime;
  final String? endTime;
  final String contract;
  final List<TimelineEntity> timelines;

  ExperienceEntity({
    required this.companyName,
    required this.companyLogo,
    required this.startTime,
    required this.endTime,
    required this.timelines,
    required this.contract,
  });

  String get getCompanyLogo => 'assets/images/$companyLogo';
}
