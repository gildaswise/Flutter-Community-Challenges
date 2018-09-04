import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:meta/meta.dart';
import 'model/model.dart';
import 'pager_page.dart';

class CurrentChallenge extends StatefulWidget implements PagerPage {
  @override
  _CurrentChallengeState createState() => _CurrentChallengeState();

  @override
  Widget fabBuilder(BuildContext context) => FloatingActionButton.extended(
    onPressed: () {
      Navigator.pushNamed(context, "/SubmitEntryToChallenge");
    },
    icon: Icon(Icons.add),
    label: Text("Submit Entry"),
  );
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    "Challenge Title",
                    style: Theme.of(context).primaryTextTheme.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Time left : 00d. 00:00",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        Text(
                          "X Submissions",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GridView.count(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 4,
          childAspectRatio: 0.5,
          children: <Widget>[
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
            AppSubmissionPreview(
              submission: AppSubmission(title: "LOOOOOOOONG APP TITLE", media: [
                "https://www.torontopearson.com/uploadedImages/Pearson/Content/Flights/Mobile_App/AppScreenshot.jpg",
              ]),
            ),
          ],
        ),
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
    return Card(
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            margin: EdgeInsets.zero,
            elevation: 0.0,
            child: Image(
              image: AdvancedNetworkImage(
                submission.media[0],
              ),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                submission.title,
                style: Theme.of(context).primaryTextTheme.body2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
