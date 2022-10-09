import 'dart:async';
import 'dart:developer';

import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepository {
  StreamController<List<UserModel>> userStreamController =
      StreamController<List<UserModel>>();

  late Stream<List<UserModel>> videoDataStream =
      listenToTweetsRealTime().asBroadcastStream();

  Stream<List<UserModel>> listenToTweetsRealTime() async* {
    var tweetReference =
        FirebaseFirestore.instance.collection(CollectionNames.users);

    tweetReference.snapshots().listen((QuerySnapshot tweetsSnapshot) {
      List<UserModel> order =
          tweetsSnapshot.docs.map((DocumentSnapshot snapshot) {
        return UserModel.fromJson(snapshot.data()! as Map<String, dynamic>);
      }).toList();
      userStreamController.add(order);
      videoDataStream.asyncMap((event) => order);
    });
    yield* userStreamController.stream;
  }
}
