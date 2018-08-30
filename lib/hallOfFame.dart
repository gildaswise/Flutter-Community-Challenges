import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class HallOfFame extends StatefulWidget {
  @override
  _HallOfFameState createState() => _HallOfFameState();
}

class _HallOfFameState extends State<HallOfFame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(GroovinMaterialIcons.crown),
      ),
    );
  }
}
