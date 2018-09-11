import 'dart:async';
import 'package:flutter/services.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_community_challenges/googleSignIn.dart';

// The layout of this screen will be improved - GroovinChip

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  FirebaseUser google_user;

  // gets called on button press
  Future _loginUser() async {
    var api = await GoogleSignInAPI.signInWithGoogle();
    if (api != null) {
      google_user = api.firebaseUser;
      CollectionReference dbForUser = Firestore.instance.collection("Users");
      if (dbForUser.document(google_user.uid).path.isNotEmpty) {
        setState(() {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/MainViews', (Route<dynamic> route) => false);
        });
      } else {
        dbForUser.document(google_user.uid).setData({});
      }
    } else {

    }
  }

  // tracks whether the user is logged in
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();
    verifyUser();
  }

  verifyUser() async {
    final user = await FirebaseAuth.instance.currentUser();
    if (user != null) {
      google_user = user;
      setState(() {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/MainViews', (Route<dynamic> route) => false);
      });
      if (mounted) {
        setState(() {
          _loggedIn = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    Text("Flutter Community",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("Challenges",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text("Dev Login"),
                onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/MainViews', (Route<dynamic> route) => false);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: _loggedIn
                    ? const Center(child: CircularProgressIndicator())
                    : RaisedButton.icon(
                  color: Colors.indigo,
                  icon: Icon(
                    GroovinMaterialIcons.google,
                    color: Colors.white,
                  ),
                  label: Text("Sign in with Google",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async => await _loginUser().catchError((e) => print(e)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
