import 'package:activitelifef/generated/json/base/json_convert_content.dart';

import '../../data/models/exercices_model_entity.dart';

ExercicesModelEntity $ExercicesModelEntityFromJson(Map<String, dynamic> json) {
  final ExercicesModelEntity exercicesModelEntity = ExercicesModelEntity();
  final String? bodyPart = jsonConvert.convert<String>(json['bodyPart']);
  if (bodyPart != null) {
    exercicesModelEntity.bodyPart = bodyPart;
  }
  final String? equipment = jsonConvert.convert<String>(json['equipment']);
  if (equipment != null) {
    exercicesModelEntity.equipment = equipment;
  }
  final String? gifUrl = jsonConvert.convert<String>(json['gifUrl']);
  if (gifUrl != null) {
    exercicesModelEntity.gifUrl = gifUrl;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    exercicesModelEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    exercicesModelEntity.name = name;
  }
  final String? target = jsonConvert.convert<String>(json['target']);
  if (target != null) {
    exercicesModelEntity.target = target;
  }
  final List<String>? secondaryMuscles = (json['secondaryMuscles'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (secondaryMuscles != null) {
    exercicesModelEntity.secondaryMuscles = secondaryMuscles;
  }
  final List<String>? instructions = (json['instructions'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (instructions != null) {
    exercicesModelEntity.instructions = instructions;
  }
  return exercicesModelEntity;
}

Map<String, dynamic> $ExercicesModelEntityToJson(ExercicesModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bodyPart'] = entity.bodyPart;
  data['equipment'] = entity.equipment;
  data['gifUrl'] = entity.gifUrl;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['target'] = entity.target;
  data['secondaryMuscles'] = entity.secondaryMuscles;
  data['instructions'] = entity.instructions;
  return data;
}

extension ExercicesModelEntityExtension on ExercicesModelEntity {
  ExercicesModelEntity copyWith({
    String? bodyPart,
    String? equipment,
    String? gifUrl,
    String? id,
    String? name,
    String? target,
    List<String>? secondaryMuscles,
    List<String>? instructions,
  }) {
    return ExercicesModelEntity()
      ..bodyPart = bodyPart ?? this.bodyPart
      ..equipment = equipment ?? this.equipment
      ..gifUrl = gifUrl ?? this.gifUrl
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..target = target ?? this.target
      ..secondaryMuscles = secondaryMuscles ?? this.secondaryMuscles
      ..instructions = instructions ?? this.instructions;
  }
}