import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class UpcomingChallenges extends StatefulWidget {
  @override
  _UpcomingChallengesState createState() => _UpcomingChallengesState();
}

class _UpcomingChallengesState extends State<UpcomingChallenges> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(GroovinMaterialIcons.calendar_text),
      ),
    );
  }
}
