import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:flutter_community_challenges/tinyIconButton.dart';

class SuggestedChallengeCard extends StatelessWidget {
  String challengeName;
  String challengeCategory;
  String challengeDescription;
  int votes;

  SuggestedChallengeCard({
    this.challengeName,
    this.challengeCategory,
    this.challengeDescription,
    this.votes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(challengeName),
                      Text(challengeCategory),
                      Text(challengeDescription),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: IconButton(
                          icon: Icon(GroovinMaterialIcons.arrow_up_bold),
                          onPressed: (){

                          },
                        ),
                      ),
                      Text("X Votes")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

