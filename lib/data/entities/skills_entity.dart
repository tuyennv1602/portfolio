import '../data.dart';

class SkillsEntity {
  final String type;
  final List<SkillsItemEntity> items;
  final String icon;

  SkillsEntity({
    required this.type,
    required this.items,
    required this.icon,
  });

  String get getIcon => 'assets/icons/$icon';
}
