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

  Stream realTimeStream({required String collectionName}) {
    return firestore.collection(collectionName).snapshots();
  }

  Future<QuerySnapshot> getDataFromCollection(
      {required String collectionName, required userId}) async {
    try {
      return await firestore
          .collection(collectionName)
          .where("userId", isEqualTo: userId)
          .get();
    } catch (e) {
      log(e.toString());
      throw FirestoreException();
    }
  }

  Future deleteDocument(
      {required String collectionName, required String tweet}) async {
    try {
      var query = await firestore
          .collection(collectionName)
          .where("tweet", isEqualTo: tweet)
          .get();
      for (var doc in query.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      log(e.toString());
      throw FirestoreException();
    }
  }
}
