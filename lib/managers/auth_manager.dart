import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager {
  static AuthManager _instance;

  static AuthManager get instance {
    if (_instance == null) _instance = AuthManager();
    return _instance;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore _store = Firestore.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> get currentUser async => await _auth.currentUser();
}
