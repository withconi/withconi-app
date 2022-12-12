import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enums/enum.dart';
part 'payload.freezed.dart';
part 'payload.g.dart';

@freezed
class Payload with _$Payload {
  @JsonSerializable(explicitToJson: true)
  factory Payload({
    required String routes,
    required String postId,
    required String boardId,
  }) = _Payload;

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
}
