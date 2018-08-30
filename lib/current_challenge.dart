import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:meta/meta.dart';
import 'model/model.dart';

class CurrentChallenge extends StatefulWidget {
  @override
  _CurrentChallengeState createState() => _CurrentChallengeState();
}

class _CurrentChallengeState extends State<CurrentChallenge> {
  bool running;

  @override
  void initState() {
    super.initState();
    running = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: RunningChallenge(),
    );
  }
}

class RunningChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 400.0,
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Current Challenge:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                    Text(
                      "Challenge Name",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 20.0),
                    ),
                    Text(
                      "Time Remaining: 00d, 00:00",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 16.0),
                    ),
                    Text(
                      "Submissions so far: X",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 8.0,
          children: <Widget>[
            AppSubmissionPreview(
              submission: AppSubmission(media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg"
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg"
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg"
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg"
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg"
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg"
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg"
              ]),
            ),
          ],
        )
      ],
    );
  }
}

class AppSubmissionPreview extends StatelessWidget {
  final AppSubmission submission;
  final bool voting;

  AppSubmissionPreview({@required this.submission, this.voting = false});

  @override
  Widget build(BuildContext context) {
    final width = 180.0;
    final height = 300.0;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            height: height,
            width: width,
            child: Card(
              child: Image(
                image: AdvancedNetworkImage(
                  submission.media[0],
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Chip(
          label: Text("Long app title"),
        ),
      ],
    );
  }
}
