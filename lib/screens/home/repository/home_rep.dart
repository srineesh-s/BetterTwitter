import 'dart:developer';

import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository {
  late final Stream<List<UserModel>> usersStream = getUserList();
  Stream<List<UserModel>> getUserList() async* {
    try {
      yield* FirebaseFirestore.instance
          .collection(CollectionNames.users)
          .snapshots()
          .map((snapShot) => snapShot.docChanges
              .map((document) => UserModel.fromJson(document.doc.data() ?? {}))
              .toList());
    } catch (e) {
      print("--------------------");
      log(e.toString());
      print(e.toString());
      print("--------------------");

      rethrow;
    }
  }
}
