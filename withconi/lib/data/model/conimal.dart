import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'disease.dart';
part 'conimal.freezed.dart';
part 'conimal.g.dart';

@freezed
class Conimal with _$Conimal {
  factory Conimal({
    required String conimalId,
    required String name,
    required Species species,
    required Gender gender,
    @DateTimeConverter() required DateTime birthDate,
    @DateTimeConverter() required DateTime adoptedDate,
    @DiseaseIdConverter() required List<Disease> diseases,
  }) = _Conimal;

  factory Conimal.fromJson(Map<String, dynamic> json) =>
      _$ConimalFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(int milliseconds) {
    return DateTime.fromMillisecondsSinceEpoch(milliseconds);
  }

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}

class DiseaseIdConverter implements JsonConverter<List<Disease>, List<String>> {
  const DiseaseIdConverter();

  @override
  List<Disease> fromJson(List<dynamic> diseaseMap) {
    return diseaseMap.map((data) => Disease.fromJson(data)).toList();
  }

  @override
  List<String> toJson(List<Disease> diseases) {
    return diseases.map((disease) => disease.code).toList();
  }
}
