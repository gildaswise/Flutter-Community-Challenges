import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_community_challenges/managers/auth_manager.dart';
import 'package:flutter_community_challenges/utils/logger.dart';
import 'package:flutter_community_challenges/widgets/google_sign_in_button.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:flutter/material.dart';

// The layout of this screen will be improved - GroovinChip

class LoginScreen extends StatefulWidget {
  static const String TAG = "LOGIN_SCREEN";

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
    _updateLoading(true);
    await _authManager.currentUser.then((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed('/MainViews');
      } else {
        _updateLoading(false);
      }
    }).catchError((exception, stacktrace) {
      _handleError(exception, stacktrace);
      _showSnackBar("Couldn't sign in for now, please try again later");
    });
  }

  _handleError(Object exception, StackTrace stacktrace) {
    Logger.log(LoginScreen.TAG, message: "Error: $exception, $stacktrace");
  }

  _showSnackBar(String message) {
    if (mounted && message != null && message.isNotEmpty)
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(message)),
      );
  }

  // gets called on button press
  _loginUser() async {
    _updateLoading(true);
    final user = await _authManager.signInWithGoogle().catchError(_handleError);
    final storeUser =
        await _authManager.updateUser(user).catchError(_handleError);
    _updateLoading(false);
    if (storeUser != null && storeUser.exists) {
      Navigator.of(context).pushReplacementNamed('/MainViews');
    } else {
      _showSnackBar("Couldn't sign in for now, please try again later");
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
      onPressed: _loginUser,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Flutter Community\nChallenges",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              _loading
                  ? const CircularProgressIndicator()
                  : GoogleSignInButton(onPressed: _loginUser),
            ],
          ),
        ),
      ),
    );
  }
}
