// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      boardId: json['boardId'] as String,
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      reportItem:
          const ReportItemConverter().fromJson(json['reportItem'] as String),
      reportDesc: json['reportDesc'] as String,
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'boardId': instance.boardId,
      'postId': instance.postId,
      'userId': instance.userId,
      'reportItem': const ReportItemConverter().toJson(instance.reportItem),
      'reportDesc': instance.reportDesc,
    };
