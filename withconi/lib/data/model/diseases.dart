class DiseaseModel {
  String code;
  String name;
  List<String> symptoms;
  String description;

  DiseaseModel(
      {required this.code,
      required this.name,
      required this.symptoms,
      required this.description});

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
        code: json['code'],
        name: json['name'],
        symptoms: json['symptoms'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'symptoms': symptoms,
        'description': description,
      };
}
