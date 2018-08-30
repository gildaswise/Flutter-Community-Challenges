import 'package:json_annotation/json_annotation.dart';

part 'challenge.g.dart';


@JsonSerializable()
class SubmittedChallenge {
  final String name;
  final String description;
  final String submitterId;
  final List<String> votes;
  final int duration;
  final DateTime submittedAt;

  SubmittedChallenge({
    this.name,
    this.description,
    this.submitterId,
    this.votes,
    this.duration,
    this.submittedAt,
  });

  Map<String, dynamic> toMap() => _$SubmittedChallengeToJson(this);

  static SubmittedChallenge fromMap(Map<String, dynamic> map) => _$SubmittedChallengeFromJson(map);
}

@JsonSerializable()
class AcceptedChallenge {
  final String name;
  final String description;
  final String submitterId;
  final List<String> votes;
  final int duration;
  final DateTime submittedAt;
  final DateTime starts;

  AcceptedChallenge({
    this.name,
    this.description,
    this.submitterId,
    this.votes,
    this.duration,
    this.submittedAt,
    this.starts,
  });

  Map<String, dynamic> toMap() => _$AcceptedChallengeToJson(this);

  static AcceptedChallenge fromMap(Map<String, dynamic> map) => _$AcceptedChallengeFromJson(map);

}

@JsonSerializable()
class ArchivedChallenge {
  final String name;
  final String description;
  final String submitterId;
  final List<String> votes;
  final int duration;
  final DateTime submittedAt;
  final DateTime starts;
  final String designWinnerSubmissionId;
  final String appWinnerSubmissionId;

  ArchivedChallenge({
    this.name,
    this.description,
    this.submitterId,
    this.votes,
    this.duration,
    this.submittedAt,
    this.starts,
    this.designWinnerSubmissionId,
    this.appWinnerSubmissionId,
  });

  Map<String, dynamic> toMap() => _$ArchivedChallengeToJson(this);

  static ArchivedChallenge fromMap(Map<String, dynamic> map) => _$ArchivedChallengeFromJson(map);

}
