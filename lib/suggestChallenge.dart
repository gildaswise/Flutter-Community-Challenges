import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class SuggestChallenge extends StatefulWidget {
  @override
  _SuggestChallengeState createState() => _SuggestChallengeState();
}

class _SuggestChallengeState extends State<SuggestChallenge> {
  TextEditingController challengeNameController = TextEditingController();
  String challengeCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggest A Challenge"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(GroovinMaterialIcons.sign_text), // needs a better icon
              title: TextField(
                decoration: InputDecoration(
                  labelText: "Challenge Name",
                ),
              ),
            ),
            ListTile(
              leading: Icon(GroovinMaterialIcons.more), // needs a better icon
              title: DropdownButton(
                hint: Text("Choose a Challenge Category"),
                value: challengeCategory,
                items: [
                  DropdownMenuItem(
                    child: Text("Test"),
                    value: "Test",
                  ),
                ],
                onChanged: (value){
                  challengeCategory = value;
                },
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(GroovinMaterialIcons.content_save_outline),
        label: Text("Submit"),
        onPressed: (){
          
        },
      ),
    );
  }
}
