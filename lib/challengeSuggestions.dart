import 'package:flutter/material.dart';
import 'package:flutter_community_challenges/suggestedChallengeCard.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'pager_page.dart';

// Eventually, the data that SuggestedChallengeCards are built with will come from Firebase

class ChallengeSuggestions extends StatefulWidget implements PagerPage {
  @override
  _ChallengeSuggestionsState createState() => _ChallengeSuggestionsState();

  @override
  Widget fabBuilder(BuildContext context) => FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/SuggestChallenge");
        },
        icon: Icon(Icons.add),
        label: Text("Suggest Challenge"),
      );

  @override
  PreferredSizeWidget headerBuilder(BuildContext context, bool isScrolled) => PreferredSize(child: Container(), preferredSize: Size.zero);
}

class _ChallengeSuggestionsState extends State<ChallengeSuggestions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SuggestedChallengeCard(
            challengeName: "Test Challenge",
            challengeCategory: "Test Category",
            challengeDescription: "Test Description",
          ),
        ],
      )
    );
  }
}
