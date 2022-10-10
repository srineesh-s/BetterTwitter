// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/models/user/user_model.dart';

class HomeRepository {
  StreamController<List<TweetModel>> userStreamController =
      StreamController<List<TweetModel>>();

  late Stream<List<TweetModel>> videoDataStream =
      listenToTweetsRealTime().asBroadcastStream();

  Stream<List<TweetModel>> listenToTweetsRealTime() async* {
    var tweetReference = FirebaseFirestore.instance
        .collection(CollectionNames.tweets)
        .orderBy('date', descending: true);
    tweetReference.snapshots().listen((QuerySnapshot tweetsSnapshot) {
      List<TweetModel> order =
          tweetsSnapshot.docs.map((DocumentSnapshot snapshot) {
        return TweetModel.fromJson(snapshot.data()! as Map<String, dynamic>);
      }).toList();
      userStreamController.add(order);
      videoDataStream.asyncMap((event) => order);
    });
    yield* userStreamController.stream;
  }
}
