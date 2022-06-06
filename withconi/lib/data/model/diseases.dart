import 'package:equatable/equatable.dart';

class DiseaseModel extends Equatable {
  String code;
  String name;
  List<String> symptoms;
  String description;
  int createdAt;

  DiseaseModel({
    required this.createdAt,
    required this.code,
    required this.name,
    required this.symptoms,
    required this.description,
  });

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
        createdAt: json['createdAt'],
        code: json['code'],
        name: json['name'],
        symptoms: json['symptoms'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt,
        'code': code,
        'name': name,
        'symptoms': symptoms,
        'description': description,
      };

  @override
  List<Object> get props => [this.code, this.name];
}
