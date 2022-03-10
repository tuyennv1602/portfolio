import 'package:json_annotation/json_annotation.dart';
import 'package:my_portfolio/data/data.dart';

part 'experience_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExperienceModel {
  @JsonKey(name: 'company_name')
  final String companyName;

  @JsonKey(name: 'company_logo')
  final String companyLogo;

  @JsonKey(name: 'start_time')
  final String startTime;

  @JsonKey(name: 'end_time')
  final String? endTime;

  @JsonKey(name: 'timelines')
  final List<TimelineModel> timelines;

  final String contract;

  ExperienceModel({
    required this.companyName,
    required this.companyLogo,
    required this.startTime,
    required this.endTime,
    required this.timelines,
    required this.contract,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> data) => _$ExperienceModelFromJson(data);

  Map<String, dynamic> toJson() => _$ExperienceModelToJson(this);
}

extension ExperienceModelExt on ExperienceModel {
  ExperienceEntity get toEntity {
    return ExperienceEntity(
      companyName: companyName,
      companyLogo: companyLogo,
      startTime: startTime,
      endTime: endTime,
      timelines: timelines.map((t) => t.toEntity).toList(),
      contract: contract,
    );
  }
}
