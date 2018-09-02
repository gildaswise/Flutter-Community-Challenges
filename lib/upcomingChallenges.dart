import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'pager_page.dart';
class UpcomingChallenges extends StatefulWidget implements PagerPage {
  @override
  _UpcomingChallengesState createState() => _UpcomingChallengesState();

  @override
  Widget fabBuilder(BuildContext context) => Container();

  @override
  PreferredSizeWidget headerBuilder(BuildContext context, bool isScrolled) => PreferredSize(child: Container(), preferredSize: Size.zero);
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
