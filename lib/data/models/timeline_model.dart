import 'package:json_annotation/json_annotation.dart';
import 'package:my_portfolio/data/data.dart';
part 'timeline_model.g.dart';

@JsonSerializable()
class TimelineModel {
  final String title;
  final String description;

  TimelineModel({
    required this.title,
    required this.description,
  });

  factory TimelineModel.fromJson(Map<String, dynamic> data) => _$TimelineModelFromJson(data);

  Map<String, dynamic> toJson() => _$TimelineModelToJson(this);
}

extension TimelineModelExt on TimelineModel {
  TimelineEntity get toEntity {
    return TimelineEntity(title: title, description: description);
  }
}
