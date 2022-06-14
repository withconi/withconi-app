import 'package:equatable/equatable.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conimal.g.dart';

@JsonSerializable(explicitToJson: true)
class ConimalModel extends Equatable {
  ConimalModel(
      {required this.birthDate,
      required this.name,
      required this.adoptedDate,
      required this.diseases,
      required this.createdAt});

  int birthDate;
  String name;
  int adoptedDate;
  List<DiseaseModel> diseases;
  int createdAt;

  factory ConimalModel.fromJson(Map<String, dynamic> json) =>
      _$ConimalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConimalModelToJson(this);

  @override
  List<Object> get props => [this.name, this.createdAt];
}

List<ConimalModel> parseConimal(Map<String, dynamic> data) {
  final conimalList = data['data']['list']
      .map<ConimalModel>((json) => ConimalModel.fromJson(json))
      .toList();
  return conimalList;
}
