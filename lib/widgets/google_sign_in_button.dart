import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function onPressed;

  GoogleSignInButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: () => this.onPressed(),
      color: Colors.white,
      splashColor: Colors.white70,
      highlightColor: Colors.grey[50],
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Image.asset(
          "assets/images/glogo.png",
          height: 18.0,
          width: 18.0,
        ),
      ),
      label: Text(
        "Sign in with Google",
        style: TextStyle(
          fontFamily: 'GoogleSans',
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
