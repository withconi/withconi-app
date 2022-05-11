import 'package:withconi/data/model/diseases.dart';

class ConimalModel {
  int birthDate;
  String name;
  int adoptedDate;
  DiseaseModel disease;
  int createdAt;

  ConimalModel(
      {required this.birthDate,
      required this.name,
      required this.adoptedDate,
      required this.disease,
      required this.createdAt});

  factory ConimalModel.fromJson(Map<String, dynamic> json) {
    return ConimalModel(
        birthDate: json['birthDate'],
        name: json['name'],
        adoptedDate: json['adoptedDate'],
        disease: json['disease'],
        createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() => {
        'birthDate': birthDate,
        'name': name,
        'adoptedDate': adoptedDate,
        'disease': disease.toJson(),
        'createdAt': createdAt,
      };
}
