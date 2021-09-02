// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EdwayPath _$EdwayPathFromJson(Map<String, dynamic> json) {
  return EdwayPath(
    json['id'] as String,
    json['name'] as String?,
    json['normalizedName'] as String?,
    json['description'] as String?,
    json['accessibility'] as int,
    json['requirements'] as String?,
    json['severity'] as String?,
    json['rate'] as int,
    json['userId'] as String?,
  );
}

Map<String, dynamic> _$EdwayPathToJson(EdwayPath instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'normalizedName': instance.normalizedName,
      'description': instance.description,
      'accessibility': instance.accessibility,
      'requirements': instance.requirements,
      'severity': instance.severity,
      'rate': instance.rate,
      'userId': instance.userId,
    };
