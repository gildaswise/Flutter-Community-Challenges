// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmittedChallenge _$SubmittedChallengeFromJson(Map<String, dynamic> json) {
  return SubmittedChallenge(
      name: json['name'] as String,
      description: json['description'] as String,
      submitterId: json['submitterId'] as String,
      votes: (json['votes'] as List)?.map((e) => e as String)?.toList(),
      duration: json['duration'] as int,
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String));
}

Map<String, dynamic> _$SubmittedChallengeToJson(SubmittedChallenge instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'submitterId': instance.submitterId,
      'votes': instance.votes,
      'duration': instance.duration,
      'submittedAt': instance.submittedAt?.toIso8601String()
    };

AcceptedChallenge _$AcceptedChallengeFromJson(Map<String, dynamic> json) {
  return AcceptedChallenge(
      name: json['name'] as String,
      description: json['description'] as String,
      submitterId: json['submitterId'] as String,
      votes: (json['votes'] as List)?.map((e) => e as String)?.toList(),
      duration: json['duration'] as int,
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String),
      starts: json['starts'] == null
          ? null
          : DateTime.parse(json['starts'] as String));
}

Map<String, dynamic> _$AcceptedChallengeToJson(AcceptedChallenge instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'submitterId': instance.submitterId,
      'votes': instance.votes,
      'duration': instance.duration,
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'starts': instance.starts?.toIso8601String()
    };

ArchivedChallenge _$ArchivedChallengeFromJson(Map<String, dynamic> json) {
  return ArchivedChallenge(
      name: json['name'] as String,
      description: json['description'] as String,
      submitterId: json['submitterId'] as String,
      votes: (json['votes'] as List)?.map((e) => e as String)?.toList(),
      duration: json['duration'] as int,
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String),
      starts: json['starts'] == null
          ? null
          : DateTime.parse(json['starts'] as String),
      designWinnerSubmissionId: json['designWinnerSubmissionId'] as String,
      appWinnerSubmissionId: json['appWinnerSubmissionId'] as String);
}

Map<String, dynamic> _$ArchivedChallengeToJson(ArchivedChallenge instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'submitterId': instance.submitterId,
      'votes': instance.votes,
      'duration': instance.duration,
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'starts': instance.starts?.toIso8601String(),
      'designWinnerSubmissionId': instance.designWinnerSubmissionId,
      'appWinnerSubmissionId': instance.appWinnerSubmissionId
    };
