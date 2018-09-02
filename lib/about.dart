import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'pager_page.dart';
class About extends StatefulWidget implements PagerPage {
  @override
  _AboutState createState() => _AboutState();

  @override
  Widget fabBuilder(BuildContext context) => Container();

  @override
  PreferredSizeWidget headerBuilder(BuildContext context, bool isScrolled) => null;
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(GroovinMaterialIcons.information_outline),
      ),
    );
  }
}
