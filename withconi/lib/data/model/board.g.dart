// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Board _$$_BoardFromJson(Map<String, dynamic> json) => _$_Board(
      boardId: json['boardId'] as int,
      title: json['title'] as String,
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
    );

Map<String, dynamic> _$$_BoardToJson(_$_Board instance) => <String, dynamic>{
      'boardId': instance.boardId,
      'title': instance.title,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
