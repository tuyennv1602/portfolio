import 'package:json_annotation/json_annotation.dart';
import 'package:my_portfolio/data/data.dart';
part 'summary_model.g.dart';

@JsonSerializable()
class SummaryModel {
  final String title;
  final String description;
  SummaryModel({
    required this.title,
    required this.description,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> data) => _$SummaryModelFromJson(data);

  Map<String, dynamic> toJson() => _$SummaryModelToJson(this);
}

extension SummaryModelExt on SummaryModel {
  SummaryEnitity get toEntity {
    return SummaryEnitity(title: title, description: description);
  }
}
