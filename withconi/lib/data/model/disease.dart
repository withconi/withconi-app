import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'disease.g.dart';

@JsonSerializable()
class DiseaseModel extends Equatable {
  DiseaseModel({
    required this.createdAt,
    required this.code,
    required this.name,
    required this.symptoms,
    required this.description,
  });

  String code;
  String name;
  List<String> symptoms;
  String description;
  int createdAt;

  factory DiseaseModel.fromJson(Map<String, dynamic> json) =>
      _$DiseaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$DiseaseModelToJson(this);

  @override
  List<Object> get props => [this.code, this.name];
}

List<DiseaseModel> parseDisease(Map<String, dynamic> data) {
  final diseaseList = data['list']
      .map<DiseaseModel>((json) => DiseaseModel.fromJson(json))
      .toList();
  return diseaseList;
}
