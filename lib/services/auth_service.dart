import 'dart:developer' as dev;
import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '';

import '../models/user/user_model.dart';

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}

class AuthService {
  FirebaseAuth auth;
  AuthService({
    required this.auth,
  });

  // create user obj based on FirebaseUser
  UserModel get userFromFirebaseUser => _userFromFirebaseUser();
  UserModel _userFromFirebaseUser() {
    var user = auth.currentUser;
    return UserModel(
      email: user!.email ?? "",
      name: user.displayName ?? "",
      image: user.photoURL ?? "photo url",
      userId: user.uid,
    );
  }

  // sign in with email & password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      _userFromFirebaseUser();
      return user;
    } catch (e) {
      dev.log(e.toString());
      throw AuthException("Authentication failed");
    }
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      user!.updateDisplayName(userName);
      user.updatePhotoURL(1.toString());
      _userFromFirebaseUser();
      return user;
    } catch (e) {
      dev.log(e.toString());
      throw AuthException(e.toString());
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
