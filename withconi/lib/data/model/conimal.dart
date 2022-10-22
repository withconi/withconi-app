import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'disease.dart';
part 'conimal.freezed.dart';
part 'conimal.g.dart';

@freezed
class Conimal with _$Conimal {
  @JsonSerializable(explicitToJson: true)
  factory Conimal({
    required String conimalId,
    required String name,
    required Species species,
    required Gender gender,
    @Default('') String? userId,
    @DateTimeConverter() required DateTime birthDate,
    @DateTimeConverter() required DateTime adoptedDate,
    @DiseaseIdConverter() @Default([]) List<Disease> diseases,
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

class DiseaseIdConverter
    implements JsonConverter<List<Disease>, List<dynamic>> {
  const DiseaseIdConverter();

  @override
  List<Disease> fromJson(List<dynamic>? diseaseMap) {
    try {
      if (diseaseMap == null || diseaseMap.isEmpty) {
        return [];
      } else {
        return diseaseMap.map((data) => Disease.fromJson(data)).toList();
      }
    } catch (e) {
      return [];
    }
  }

  @override
  List<String> toJson(List<dynamic> diseases) {
    if (diseases.isEmpty) {
      return [];
    } else {
      return diseases.map((disease) => disease.code.toString()).toList();
    }
  }
}
