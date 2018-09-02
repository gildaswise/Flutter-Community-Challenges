import 'package:flutter/material.dart';
import 'package:flutter_community_challenges/mainViews.dart';
import 'package:flutter_community_challenges/submitEntry.dart';
import 'package:flutter_community_challenges/suggestChallenge.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Community Challenges',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'GoogleSans'
      ),
      home: MainViews(title: 'Flutter Community Challenges'),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/SuggestChallenge": (BuildContext context) => SuggestChallenge(),
        "/SubmitEntryToChallenge": (BuildContext context) => SubmitEntryToChallenge(),
      },
    );
  }
}