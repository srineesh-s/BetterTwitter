import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

class FirestoreException implements Exception {}

class DbService {
  FirebaseFirestore firestore;
  DbService({required this.firestore});

  Future<bool> addDataToCollection(
      {required String collectionName,
      required Map<String, dynamic> data}) async {
    try {
      await firestore.collection(collectionName).add(data);
      return true;
    } catch (e) {
      log(e.toString());
      throw FirestoreException();
    }
  }
}
