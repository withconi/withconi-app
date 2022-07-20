import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/conimal.dart';
part 'board.freezed.dart';
part 'board.g.dart';

@freezed
class Board with _$Board {
  @JsonSerializable(explicitToJson: true)
  factory Board({
    required int boardId,
    required String title,
    @DateTimeConverter() required DateTime createdAt,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}
