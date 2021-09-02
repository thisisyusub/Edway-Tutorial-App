import 'package:json_annotation/json_annotation.dart';

part 'path.g.dart';

@JsonSerializable()
class EdwayPath {
  final String id;
  final String? name;
  final String? normalizedName;
  final String? description;
  final int accessibility;
  final String? requirements;
  final String? severity;
  final int rate;
  final String? userId;

  EdwayPath(
    this.id,
    this.name,
    this.normalizedName,
    this.description,
    this.accessibility,
    this.requirements,
    this.severity,
    this.rate,
    this.userId,
  );

  factory EdwayPath.fromJson(Map<String, dynamic> json) =>
      _$EdwayPathFromJson(json);
  Map<String, dynamic> toJson() => _$EdwayPathToJson(this);
}
