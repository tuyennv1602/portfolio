class ContactEntity {
  final String icon;
  final String name;
  final String? link;

  ContactEntity({required this.icon, required this.name, this.link});

  String get getIcon => 'assets/images/$icon';

  String? get shortLink => link?.split(':')[1].replaceAll('//', '');
}
