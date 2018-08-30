import 'package:json_annotation/json_annotation.dart';

part 'submission.g.dart';

@JsonSerializable()
class AppSubmission {
  final String title;
  final String description;
  final Uri github;
  final Uri playStore;
  final Uri appStore;
  final DateTime submitted;
  final String submitterId;
  final List<String> media;
  final List<String> votes;

  AppSubmission({
    this.title,
    this.description,
    this.github,
    this.playStore,
    this.appStore,
    this.submitted,
    this.submitterId,
    this.media,
    this.votes,
  });

  Map<String, dynamic> toMap() => _$AppSubmissionToJson(this);

  static AppSubmission fromMap(Map<String, dynamic> map) =>
      _$AppSubmissionFromJson(map);
}

@JsonSerializable()
class DesignSubmission {
  final String title;
  final String description;
  final DateTime submitted;
  final String submitterId;
  final List<String> media;
  final List<String> votes;

  DesignSubmission({
    this.title,
    this.description,
    this.submitted,
    this.submitterId,
    this.media,
    this.votes,
  });

  Map<String, dynamic> toMap() => _$DesignSubmissionToJson(this);

  static DesignSubmission fromMap(Map<String, dynamic> map) =>
      _$DesignSubmissionFromJson(map);
}

