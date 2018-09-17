import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_community_challenges/managers/methods.dart';
import 'package:flutter_community_challenges/utils/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager {
  static const String TAG = "AUTH_MANAGER";
  static const String COLLECTION_TAG = "users";

  static AuthManager _instance;

  static AuthManager get instance {
    if (_instance == null) _instance = AuthManager();
    return _instance;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore _store = Firestore.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> get currentUser async => await _auth.currentUser();

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser =
        await _googleSignIn.signIn().catchError((exception, stacktrace) {
      Logger.log(TAG, message: "Failed on Google's sign in, error: $exception");
    });
    final GoogleSignInAuthentication googleAuth =
        await googleUser?.authentication;
    return await _auth.signInWithGoogle(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
  }

  Future<DocumentSnapshot> updateUser(FirebaseUser user) async {
    if (user == null) return null;

    final DocumentReference reference =
        _store.collection(COLLECTION_TAG).document(user?.uid);
    DocumentSnapshot userSnapshot;

    await reference
        .get()
        .then((value) => userSnapshot = value)
        .catchError((exception, stacktrace) {
      Logger.log(TAG,
          message: "Failed on Firestore's transaction, error: $exception");
      userSnapshot = null;
    });

    if (userSnapshot == null) {
      await _store.runTransaction((transaction) async {
        await transaction.set(reference, {
          "uid": user?.uid,
          "displayName": user?.displayName,
          "email": user?.email,
          "photoUrl": user?.photoUrl,
        });
      }).catchError((exception, stacktrace) {
        Logger.log(TAG,
            message: "Failed on Firestore's transaction, error: $exception");
        userSnapshot = null;
      });
      userSnapshot = await reference.get();
    }

    return userSnapshot;
  }
}
