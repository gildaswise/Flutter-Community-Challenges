import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_community_challenges/managers/auth_manager.dart';
import 'package:flutter_community_challenges/widgets/google_sign_in_button.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _authManager = AuthManager.instance;

  // tracks whether the user is logged in
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _verifyUser();
  }

  _updateLoading(bool value) {
    if (mounted) {
      setState(() {
        _loading = value;
      });
    }
  }

  _verifyUser() async {
    await _authManager.currentUser.then((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed('/MainViews');
      }
    });
  }

  _showSnackBar(String message) {
    if (mounted && message != null && message.isNotEmpty)
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Couldn't sign in: $message")),
      );
  }

  // gets called on button press
  _loginUser() async {
    _updateLoading(true);
    final user =
        await _authManager.signInWithGoogle().catchError(_showSnackBar);
    final storeUser =
        await _authManager.updateUser(user).catchError(_showSnackBar);
    if (storeUser != null && storeUser.exists) {
      _verifyUser();
    }
  }

  Widget _buildSignInButton() {
    return RaisedButton.icon(
      color: Colors.indigo,
      icon: Icon(
        GroovinMaterialIcons.google,
        color: Colors.white,
      ),
      label: Text("Sign in with Google", style: TextStyle(color: Colors.white)),
      onPressed: () async => await _loginUser(),
    );
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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Flutter Community",
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Challenges",
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text("Dev Login"),
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/MainViews'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: _loading
                    ? const CircularProgressIndicator()
                    : GoogleSignInButton(
                        onPressed: () async => await _loginUser(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
