class EducationEntity {
  final String school;
  final String logo;
  final String institute;
  final String department;
  final String time;
  final String degree;

  EducationEntity({
    required this.school,
    required this.logo,
    required this.institute,
    required this.department,
    required this.time,
    required this.degree,
  });

  String get getLogo => 'assets/images/$logo';
}
