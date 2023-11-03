import 'package:activitelifef/generated/json/base/json_field.dart';
import 'package:activitelifef/generated/json/exercices_model_entity.g.dart';
import 'dart:convert';

import 'package:activitelifef/utilits/assets_constants.dart';
export 'package:activitelifef/generated/json/exercices_model_entity.g.dart';

@JsonSerializable()
class ExercicesModelEntity {
	late String bodyPart = "exemplo body parte";
	late String equipment = "exemplo equipament";
	late String gifUrl = AssetsPath.gitExempl;
	late String id = "exemplo id";
	late String name = "exemplo name";
	late String target = "exemplo";
	late List<String> secondaryMuscles;
	late List<String> instructions;

	ExercicesModelEntity();

	factory ExercicesModelEntity.fromJson(Map<String, dynamic> json) => $ExercicesModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $ExercicesModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}