import 'package:withconi/data/model/diseases.dart';

class ConimalModel {
  String birthDate;
  String name;
  String adoptedDate;
  DiseaseModel disease;

  ConimalModel(
      {required this.birthDate,
      required this.name,
      required this.adoptedDate,
      required this.disease});

  factory ConimalModel.fromJson(Map<String, dynamic> json) {
    return ConimalModel(
        birthDate: json['birthDate'],
        name: json['name'],
        adoptedDate: json['adoptedDate'],
        disease: json['disease']);
  }

  Map<String, dynamic> toJson() => {
        'birthDate': birthDate,
        'name': name,
        'adoptedDate': adoptedDate,
        'disease': disease.toJson(),
      };
}
