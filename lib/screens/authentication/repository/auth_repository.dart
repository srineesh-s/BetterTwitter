import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/user/user_model.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  AuthService authService;
  DbService dbService;

  AuthRepository({required this.authService, required this.dbService});

  Future<bool> login(String email, String password) async {
    try {
      await authService.signInWithEmailAndPassword(email, password);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signup(
    String email,
    String password,
    String name,
  ) async {
    try {
      User? user =
          await authService.signUpWithEmailAndPassword(email, password, name);
      await dbService.addDataToCollection(
          collectionName: CollectionNames.users,
          data: UserModel(
            email: email,
            image: 1.toString(),
            name: name,
            userId: user!.uid,
          ).toJson());
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signout() async {
    try {
      await authService.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
