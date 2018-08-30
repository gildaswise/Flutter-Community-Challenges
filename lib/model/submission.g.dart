// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSubmission _$AppSubmissionFromJson(Map<String, dynamic> json) {
  return AppSubmission(
      title: json['title'] as String,
      description: json['description'] as String,
      github:
          json['github'] == null ? null : Uri.parse(json['github'] as String),
      playStore: json['playStore'] == null
          ? null
          : Uri.parse(json['playStore'] as String),
      appStore: json['appStore'] == null
          ? null
          : Uri.parse(json['appStore'] as String),
      submitted: json['submitted'] == null
          ? null
          : DateTime.parse(json['submitted'] as String),
      submitterId: json['submitterId'] as String,
      media: (json['media'] as List)?.map((e) => e as String)?.toList(),
      votes: (json['votes'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$AppSubmissionToJson(AppSubmission instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'github': instance.github?.toString(),
      'playStore': instance.playStore?.toString(),
      'appStore': instance.appStore?.toString(),
      'submitted': instance.submitted?.toIso8601String(),
      'submitterId': instance.submitterId,
      'media': instance.media,
      'votes': instance.votes
    };

DesignSubmission _$DesignSubmissionFromJson(Map<String, dynamic> json) {
  return DesignSubmission(
      title: json['title'] as String,
      description: json['description'] as String,
      submitted: json['submitted'] == null
          ? null
          : DateTime.parse(json['submitted'] as String),
      submitterId: json['submitterId'] as String,
      media: (json['media'] as List)?.map((e) => e as String)?.toList(),
      votes: (json['votes'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$DesignSubmissionToJson(DesignSubmission instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'submitted': instance.submitted?.toIso8601String(),
      'submitterId': instance.submitterId,
      'media': instance.media,
      'votes': instance.votes
    };
